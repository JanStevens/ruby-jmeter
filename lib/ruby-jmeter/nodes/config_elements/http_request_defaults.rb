module RubyJmeter
  module Nodes
    module ConfigElements
      class HttpRequestDefaults < Nodes::Base
        defaults path: '/', implementation: 'HttpClient4', image_parser: true, concurrent_dwn: true,
          concurrent_pool: 4
        allowed %i(domain port connect_timeout response_timeout protocol content_encoding
          path implementation image_parser concurrent_dwn concurrent_pool)

        mapping use_concurrent_pool: :concurrent_dwn

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <ConfigTestElement guiclass="HttpDefaultsGui" testclass="ConfigTestElement" testname="" enabled="true">
            <elementProp name="HTTPsampler.Arguments" elementType="Arguments" guiclass="HTTPArgumentsPanel" testclass="Arguments" testname="" enabled="true">
              <collectionProp name="Arguments.arguments"/>
            </elementProp>
            <stringProp name="HTTPSampler.domain"/>
            <stringProp name="HTTPSampler.port"/>
            <stringProp name="HTTPSampler.connect_timeout"/>
            <stringProp name="HTTPSampler.response_timeout"/>
            <stringProp name="HTTPSampler.protocol"/>
            <stringProp name="HTTPSampler.contentEncoding"/>
            <stringProp name="HTTPSampler.path" />
            <stringProp name="HTTPSampler.implementation" />
            <boolProp name="HTTPSampler.image_parser" />
            <boolProp name="HTTPSampler.concurrentDwn" />
            <stringProp name="HTTPSampler.concurrentPool" />
            <stringProp name="HTTPSampler.embedded_url_re" />
          </ConfigTestElement>
          XML
        end
      end
    end
  end
end
