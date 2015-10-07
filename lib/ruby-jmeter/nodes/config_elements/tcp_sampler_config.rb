module RubyJmeter
  module Nodes
    module ConfigElements
      class TcpSamplerConfig < Nodes::Base
        defaults reUseConnection: true, nodelay: false, closeConnection: false
        allowed %i(server reuse_connection port nodelay timeout request close_connection)
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <ConfigTestElement guiclass="TCPConfigGui" testclass="ConfigTestElement" testname="" enabled="true">
            <stringProp name="TCPSampler.server"/>
            <boolProp name="TCPSampler.reUseConnection" />
            <stringProp name="TCPSampler.port"/>
            <boolProp name="TCPSampler.nodelay" />
            <stringProp name="TCPSampler.timeout"/>
            <stringProp name="TCPSampler.request"/>
            <boolProp name="TCPSampler.closeConnection" />
          </ConfigTestElement>
          XML
        end
      end
    end
  end
end
