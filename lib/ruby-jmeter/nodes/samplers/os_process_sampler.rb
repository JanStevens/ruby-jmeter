module RubyJmeter
  module Nodes
    module Samplers
      # @TODO Arguments.arguments
      class OsProcessSampler < Nodes::Base
        defaults checkReturnCode: false, expectedReturnCode: 0
        allowed %i(checkReturnCode expectedReturnCode command arguments environment directory)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <SystemSampler guiclass="SystemSamplerGui" testclass="SystemSampler" testname="" enabled="true">
              <boolProp name="SystemSampler.checkReturnCode" />
              <stringProp name="SystemSampler.expectedReturnCode" />
              <stringProp name="SystemSampler.command"/>
              <elementProp name="SystemSampler.arguments" elementType="Arguments" guiclass="ArgumentsPanel" testclass="Arguments" testname="" enabled="true">
                <collectionProp name="Arguments.arguments"/>
              </elementProp>
              <elementProp name="SystemSampler.environment" elementType="Arguments" guiclass="ArgumentsPanel" testclass="Arguments" testname="" enabled="true">
                <collectionProp name="Arguments.arguments"/>
              </elementProp>
              <stringProp name="SystemSampler.directory"/>
            </SystemSampler>
          XML
        end
      end
    end
  end
end
