module RubyJmeter
  module Nodes
    module Samplers
      class JmsSubscriber < Nodes::Base
        defaults jndi_properties: false, authenticate: false, iterations: 1, read_response: true,
          client_choice: 'jms_subscriber_receive'

        allowed %i(jndi_properties initial_context_factory provider_url connection_factory topic
          security_principle security_credentials authenticate iterations read_response client_choice)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <SubscriberSampler guiclass="JMSSubscriberGui" testclass="SubscriberSampler" testname="" enabled="true">
            <stringProp name="jms.jndi_properties" />
            <stringProp name="jms.initial_context_factory"/>
            <stringProp name="jms.provider_url"/>
            <stringProp name="jms.connection_factory"/>
            <stringProp name="jms.topic"/>
            <stringProp name="jms.security_principle"/>
            <stringProp name="jms.security_credentials"/>
            <boolProp name="jms.authenticate" />
            <stringProp name="jms.iterations" />
            <stringProp name="jms.read_response" />
            <stringProp name="jms.client_choice" />
          </SubscriberSampler>
          XML
        end
      end
    end
  end
end
