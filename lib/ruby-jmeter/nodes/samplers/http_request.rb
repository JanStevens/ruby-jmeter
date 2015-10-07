module RubyJmeter
  module Nodes
    module Samplers
      class HttpRequest < Nodes::Base
        defaults method: 'GET', follow_redirects: true, auto_redirects: false, use_keepalive: true,
          do_multipart_post: false, monitor: false
        allowed %i(arguments domain port connect_timeout response_timeout protocol
          content_encoding path method follow_redirects auto_redirects use_keepalive
          do_multipart_post implementation monitor embedded_url_re comments params always_encode)

        mapping do_multipart_post: :DO_MULTIPART_POST, content_encoding: :contentEncoding

        skip_conversion!

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <HTTPSamplerProxy guiclass="HttpTestSampleGui" testclass="HTTPSamplerProxy" testname="" enabled="true">
              <elementProp name="HTTPsampler.Arguments" elementType="Arguments" guiclass="HTTPArgumentsPanel" testclass="Arguments" testname="" enabled="true">
                <collectionProp name="Arguments.arguments"/>
              </elementProp>
              <stringProp name="HTTPSampler.domain"/>
              <stringProp name="HTTPSampler.port"/>
              <stringProp name="HTTPSampler.connect_timeout"/>
              <stringProp name="HTTPSampler.response_timeout"/>
              <stringProp name="HTTPSampler.protocol"/>
              <stringProp name="HTTPSampler.contentEncoding"/>
              <stringProp name="HTTPSampler.path"/>
              <stringProp name="HTTPSampler.method" />
              <boolProp name="HTTPSampler.follow_redirects"/>
              <boolProp name="HTTPSampler.auto_redirects"/>
              <boolProp name="HTTPSampler.use_keepalive"/>
              <boolProp name="HTTPSampler.DO_MULTIPART_POST"/>
              <stringProp name="HTTPSampler.implementation"/>
              <boolProp name="HTTPSampler.monitor"/>
              <stringProp name="HTTPSampler.embedded_url_re"/>
              <stringProp name="TestPlan.comments"/>
            </HTTPSamplerProxy>
          XML
        end
      end
    end
  end
end
