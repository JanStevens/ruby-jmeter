module RubyJmeter
  module Nodes
    module Samplers
      # @TODO Arguments.argunents
      class JmsPointtopoint < Nodes::Base
        allowed %i(queueconnectionfactory SendQueue ReceiveQueue isFireAndForget isNonPersistent
          useReqMsgIdAsCorrelId timeout xml_data initialContextFactory contextProviderUrl
          arguments)
        defaults isFireAndForget: true, isNonPersistent: false, useReqMsgIdAsCorrelId: false

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <JMSSampler guiclass="JMSSamplerGui" testclass="JMSSampler" testname="" enabled="true">
            <stringProp name="JMSSampler.queueconnectionfactory"/>
            <stringProp name="JMSSampler.SendQueue"/>
            <stringProp name="JMSSampler.ReceiveQueue"/>
            <boolProp name="JMSSampler.isFireAndForget" />
            <boolProp name="JMSSampler.isNonPersistent" />
            <boolProp name="JMSSampler.useReqMsgIdAsCorrelId" />
            <stringProp name="JMSSampler.timeout"/>
            <stringProp name="HTTPSamper.xml_data"/>
            <stringProp name="JMSSampler.initialContextFactory"/>
            <stringProp name="JMSSampler.contextProviderUrl"/>
            <elementProp name="JMSSampler.jndiProperties" elementType="Arguments" guiclass="ArgumentsPanel" testclass="Arguments" testname="" enabled="true">
              <collectionProp name="Arguments.arguments"/>
            </elementProp>
            <elementProp name="arguments" elementType="JMSProperties">
              <collectionProp name="JMSProperties.properties">
                <elementProp name="" elementType="JMSProperty">
                  <stringProp name="JMSProperty.name"> </stringProp>
                  <stringProp name="JMSProperty.value"/>
                  <stringProp name="JMSProperty.type">java.lang.String</stringProp>
                </elementProp>
              </collectionProp>
            </elementProp>
          </JMSSampler>
          XML
        end
      end
    end
  end
end
