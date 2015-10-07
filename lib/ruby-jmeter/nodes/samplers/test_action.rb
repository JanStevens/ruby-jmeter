module RubyJmeter
  module Nodes
    module Samplers
      class TestAction < Nodes::Base
        defaults action: 1, target: 0
        allowed %i(action target duration)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <TestAction guiclass="TestActionGui" testclass="TestAction" testname="" enabled="true">
            <intProp name="ActionProcessor.action" />
            <intProp name="ActionProcessor.target" />
            <stringProp name="ActionProcessor.duration"/>
          </TestAction>
          XML
        end
      end
    end
  end
end
