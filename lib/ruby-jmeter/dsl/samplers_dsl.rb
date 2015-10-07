module RubyJmeter
  module DSL
    module SamplersDSL
      %i(get post delete put patch head).each do |method|
        define_method method do |*args, &block|
          params = args.shift || {}
          params = { url: params }.merge(args.shift || {}) if params.class == String
          params[:method] = method.to_s.upcase
          params[:name] ||= params[:url]
          parse_http_request(params)
          node = RubyJmeter::Nodes::Samplers::HttpRequest.call(params)
          attach_node(node, &block)
        end
      end

      def header(headers = [])
        http_header_manager headers: Array(headers)
      end

      def with_xhr
        http_header_manager headers: [ header: 'X-Requested-With', value: 'XMLHttpRequest' ]
      end

      def with_gzip
        http_header_manager headers: [ header: 'Accept-Encoding', value: 'gzip, deflate' ]
      end

      def with_json
        http_header_manager headers: [ header: 'Accept',
          value: 'text/html, application/xhtml+xml, application/xml;q=0.9, */*;q=0.8, application/json'
          ]
      end

      def soapxmlrpc_request(params, &block)
        params[:method] ||= 'POST'
        super
      end
    end
  end
end
