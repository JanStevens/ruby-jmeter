module RubyJmeter
  module DSL
    module ConfigElementsDSL

      def user_defined_variables(params = {}, &block)
        if params.is_a?(Hash)
          params['Argument.name'] = params[:name]
        end
        super(params, &block)
      end

      def http_request_defaults(params = {}, &block)
        params[:image_parser] = true if params.keys.include? :download_resources
        params[:concurrent_dwn] = true if params.keys.include? :use_concurrent_pool
        params[:concurrent_pool] = params[:use_concurrent_pool] if params.keys.include? :use_concurrent_pool
        params[:embedded_url_re] = params[:urls_must_match] if params.keys.include? :urls_must_match
        super(params, &block)
      end

      def with_user_agent(device)
        http_header_manager headers: [
            header: 'User-Agent', value: RubyJmeter::UserAgent.to_string(device)
          ]
      end

      def with_browser(device)
        http_header_manager headers: [ header: 'User-Agent', value: RubyJmeter::UserAgent.to_string(device) ]
        http_header_manager headers: [
            { header: 'Accept-Encoding', value: 'gzip,deflate,sdch' },
            { header: 'Accept', value: 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' }
          ]
      end
    end
  end
end
