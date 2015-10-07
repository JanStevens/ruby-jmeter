module RubyJmeter
  module Nodes
    module Samplers
      class TcpSampler < Nodes::Base
        def node
          defaults reUseConnection: true, nodelay: false, closeConnection: false
          allowed %i(server reUseConnection port nodelay timeout request closeConnection username password)

          Nokogiri::XML(<<-XML.strip_heredoc)
            <TCPSampler guiclass="TCPSamplerGui" testclass="TCPSampler" testname="" enabled="true">
              <stringProp name="TCPSampler.server"/>
              <boolProp name="TCPSampler.reUseConnection" />
              <stringProp name="TCPSampler.port"/>
              <boolProp name="TCPSampler.nodelay" />
              <stringProp name="TCPSampler.timeout"/>
              <stringProp name="TCPSampler.request"/>
              <boolProp name="TCPSampler.closeConnection" />
              <stringProp name="ConfigTestElement.username"/>
              <stringProp name="ConfigTestElement.password"/>
            </TCPSampler>
          XML
        end
      end
    end
  end
end
