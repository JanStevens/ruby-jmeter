module RubyJmeter
  module Nodes
    module Samplers
      # @TODO Properties.properties solution
      class JmsPublisher < Nodes::Base
        defaults jndi_properties: false, config_choice: 'jms_use_text', config_msg_type: 'jms_text_message',
          iterations: 1, authenticate: false
        allowed %i(jndi_properties initial_context_factory provider_url connection_factory,
          topic Security_principle security_credentials text_message input_file,
          random_path config_choice config_msg_type iterations authenticate)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <PublisherSampler guiclass="JMSPublisherGui" testclass="PublisherSampler" testname="" enabled="true">
              <stringProp name="jms.jndi_properties">false</stringProp>
              <stringProp name="jms.initial_context_factory"/>
              <stringProp name="jms.provider_url"/>
              <stringProp name="jms.connection_factory"/>
              <stringProp name="jms.topic"/>
              <stringProp name="jms.security_principle"/>
              <stringProp name="jms.security_credentials"/>
              <stringProp name="jms.text_message"/>
              <stringProp name="jms.input_file"/>
              <stringProp name="jms.random_path"/>
              <stringProp name="jms.config_choice">jms_use_text</stringProp>
              <stringProp name="jms.config_msg_type">jms_text_message</stringProp>
              <stringProp name="jms.iterations">1</stringProp>
              <boolProp name="jms.authenticate">false</boolProp>
              <elementProp name="jms.jmsProperties" elementType="JMSProperties">
                <collectionProp name="JMSProperties.properties">
                  <elementProp name="" elementType="JMSProperty">
                    <stringProp name="JMSProperty.name"> </stringProp>
                    <stringProp name="JMSProperty.value"/>
                    <stringProp name="JMSProperty.type">java.lang.String</stringProp>
                  </elementProp>
                </collectionProp>
              </elementProp>
            </PublisherSampler>
          XML
        end
      end
    end
  end
end
