module RubyJmeter
  module Nodes
    module Plugins
      class DummySampler < Nodes::Base

        defaults dummy_waiting: true, dummy_successfull: true, dummy_response_code: 200, dummy_response_message: 'OK',
          dummy_response_time: 0, dummy_latency: 0
        allowed %i(dummy_waiting dummy_successfull dummy_response_code dummy_response_message dummy_request_data
          dummy_response_data dummy_response_time dummy_latency)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <kg.apc.jmeter.samplers.DummySampler guiclass="kg.apc.jmeter.samplers.DummySamplerGui" testclass="kg.apc.jmeter.samplers.DummySampler" enabled="true">
            <boolProp name="WAITING" />
            <boolProp name="SUCCESFULL" />
            <stringProp name="RESPONSE_CODE" />
            <stringProp name="RESPONSE_MESSAGE" />
            <stringProp name="REQUEST_DATA" />
            <stringProp name="RESPONSE_DATA" />
            <stringProp name="RESPONSE_TIME" />
            <stringProp name="LATENCY" />
          </kg.apc.jmeter.samplers.DummySampler>
          XML
        end
      end
    end
  end
end
