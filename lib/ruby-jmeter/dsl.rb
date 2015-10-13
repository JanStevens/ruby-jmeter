module RubyJmeter
  class ExtendedDSL
    include Parser
    include DSL::ThreadsDSL
    include DSL::ConfigElementsDSL
    include DSL::SamplersDSL
    include DSL::LogicControllersDSL
    include DSL::ListenersDSL

    attr_accessor :root

    def initialize(params = {}, saved_binding)
      @root = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
        xml.jmeterTestPlan(version: '1.2', properties: '2.8', jmeter: '2.13', 'ruby-jmeter' => '2.13.0') do
          xml.hashTree
        end
      end.doc
      node = RubyJmeter::Nodes::TestPlan.call(params)
      @saved_binding = saved_binding
      @current_node = @root.at_xpath('//jmeterTestPlan/hashTree')
      @current_node = attach_to_last(node)
    end

    Nodes::Base.all_nodes.each do |name, klass|
      superclass.send :define_method, name.to_sym do |params = {}, &block|
        node = klass.call(params)
        attach_node(node, &block)
      end

      define_method name.to_sym do |params = {}, &block|
        node = klass.call(params)
        attach_node(node, &block)
      end
    end

    alias_method :auth, :http_authorization_manager
    alias_method :variables, :user_defined_variables
    alias_method :defaults, :http_request_defaults
    alias_method :cookies, :http_cookie_manager
    alias_method :cache, :http_cache_manager

    alias_method :view_results, :view_results_tree
    alias_method :log, :simple_data_writer
    alias_method :response_graph, :response_time_graph


    alias_method :foreach_c, :foreach_controller
    alias_method :if_c, :if_controller
    alias_method :include_c, :include_controller
    alias_method :loop_c, :loop_controller
    alias_method :module_c, :module_controller
    alias_method :once_only_c, :once_only_controller
    alias_method :transaction_c, :transaction_controller

    alias_method :soap, :soapxmlrpc_request
    alias_method :ldap, :ldap_request
    alias_method :ldap_ext, :ldap_extended_request
    alias_method :ldap_extended, :ldap_extended_request
    alias_method :assert, :response_assertion

    alias_method :extract_json, :json_path_extractor

    def extract(params, &block)
      node = if params[:regex]
               params[:refname] = params[:name]
               params[:regex] = params[:regex] #CGI.escapeHTML
               params[:template] = params[:template] || "$1$"
               RubyJmeter::Nodes::PostProcessors::RegularExpressionExtractor.call(params)
             elsif params[:xpath]
               params[:refname] = params[:name]
               params[:xpathQuery] = params[:xpath]
               RubyJmeter::Nodes::PostProcessors::XpathExtractor.call(params)
             elsif params[:json]
               RubyJmeter::Nodes::Plugins::JsonPathExtractor.call(params)
             elsif params[:css]
               params[:refname] = params[:name]
               params[:expr] = params[:css]
               RubyJmeter::Nodes::PostProcessors::CssjqueryExtractor.call(params)
             end
      attach_node(node, &block)
    end

    # API Methods

    def out(params = {})
      puts doc.to_xml(:indent => 2)
    end

    def jmx(params = {})
      file(params)
      logger.info "Test plan saved to: #{params[:file]}"
    end

    def to_xml
      doc.to_xml(:indent => 2)
    end

    def to_doc
      doc.clone
    end

    def run(params = {})
      file(params)
      logger.warn "Test executing locally ..."
      properties = params.has_key?(:properties) ? build_properties(params[:properties]) : "-q #{File.dirname(__FILE__)}/helpers/jmeter.properties"

      if params[:remote_hosts]
        remote_hosts = params[:remote_hosts]
        remote_hosts = remote_hosts.join(',') if remote_hosts.kind_of?(Array)
        remote_hosts = "-R #{remote_hosts}"
      end

      cmd = "#{params[:path]}jmeter #{"-n" unless params[:gui] } -t #{params[:file]} -j #{params[:log] ? params[:log] : 'jmeter.log' } -l #{params[:jtl] ? params[:jtl] : 'jmeter.jtl' } #{properties} #{remote_hosts}"
      logger.debug cmd if params[:debug]
      Open3.popen2e("#{cmd}") do |stdin, stdout_err, wait_thr|
        while line = stdout_err.gets
          logger.debug line.chomp if params[:debug]
        end

        exit_status = wait_thr.value
        abort "FAILED !!! #{cmd}" unless exit_status.success?
      end
      logger.info "Local Results at: #{params[:jtl] ? params[:jtl] : 'jmeter.jtl'}"
    end

    private

    def hash_tree
      Nokogiri::XML::Node.new("hashTree", @root)
    end

    def attach_to_last(node)
      ht = hash_tree
      last_node = @current_node
      if node.respond_to?(:doc)
        last_node << node.doc.children << ht
      else
        last_node << node.children << ht
      end
      ht
    end

    def attach_node(node, &block)
      ht = attach_to_last(node)
      previous = @current_node
      @current_node = ht
      if block
        Combinder.new(self, @saved_binding).instance_eval(&block)
      end
      @current_node = previous
    end

    def file(params = {})
      params[:file] ||= 'jmeter.jmx'
      File.open(params[:file], 'w') do |file|
        file.write(doc.to_xml(indent: 2))
      end
    end

    def doc
      Nokogiri::XML(@root.to_s, &:noblanks)
    end

    def build_properties(properties)
      if properties.kind_of?(String)
        "-q #{properties}"
      elsif properties.kind_of?(Hash)
        properties.map { |k, v| "-J#{k}=#{v}" }.join(" ")
      end
    end

    def logger
      RubyJmeter.logger
    end
  end
end
