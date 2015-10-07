module RubyJmeter
  module Nodes
    module Samplers
      class Ajp13Sampler < Nodes::Base
        defaults method: 'GET', follow_directions: true, auto_redirects: false,
          'DO_MULTIPART_POST' => false, monitor: false

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <AjpSampler guiclass="AjpSamplerGui" testclass="AjpSampler" testname="" enabled="true">
            <elementProp name="HTTPsampler.Arguments" elementType="Arguments" guiclass="HTTPArgumentsPanel" testclass="Arguments" testname="#{params[:name]}" enabled="true">
              <collectionProp name="Arguments.arguments"/>
            </elementProp>
            <stringProp name="HTTPSampler.domain" />
            <stringProp name="HTTPSampler.port" />
            <stringProp name="HTTPSampler.connect_timeout" />
            <stringProp name="HTTPSampler.response_timeout" />
            <stringProp name="HTTPSampler.protocol" />
            <stringProp name="HTTPSampler.contentEncoding" />
            <stringProp name="HTTPSampler.path" />
            <stringProp name="HTTPSampler.method" />
            <boolProp name="HTTPSampler.follow_redirects" />
            <boolProp name="HTTPSampler.auto_redirects" />
            <boolProp name="HTTPSampler.use_keepalive" />
            <boolProp name="HTTPSampler.DO_MULTIPART_POST" />
            <boolProp name="HTTPSampler.monitor" />
            <stringProp name="HTTPSampler.embedded_url_re" />
          </AjpSampler>
          XML
        end
      end
    end
  end
end
