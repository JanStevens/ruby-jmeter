module RubyJmeter
  module Nodes
    module Samplers
      # @TODO Arguments.arguments
      class SoapxmlrpcRequest < Nodes::Base
        defaults SEND_SOAP_ACTION: true, use_keepalive: false
        allowed %i(arguments URL_DATA xml_data xml_data_file SOAP_ACTION SEND_SOAP_ACTION use_keepalive)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <SoapSampler guiclass="SoapSamplerGui" testclass="SoapSampler" testname="" enabled="true">
              <elementProp name="HTTPsampler.Arguments" elementType="Arguments">
                <collectionProp name="Arguments.arguments"/>
              </elementProp>
              <stringProp name="SoapSampler.URL_DATA"/>
              <stringProp name="HTTPSamper.xml_data"/>
              <stringProp name="SoapSampler.xml_data_file"/>
              <stringProp name="SoapSampler.SOAP_ACTION"/>
              <stringProp name="SoapSampler.SEND_SOAP_ACTION" />
              <boolProp name="HTTPSampler.use_keepalive" />
            </SoapSampler>
          XML
        end
      end
    end
  end
end
