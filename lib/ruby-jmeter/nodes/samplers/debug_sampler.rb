module RubyJmeter
  module Nodes
    module Samplers
      class DebugSampler < Nodes::Base
        defaults displayJMeterProperties: false, displayJMeterVariables: true, displaySystemProperties: false
        allowed %i(displayJMeterProperties displayJMeterVariables displaySystemProperties)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <DebugSampler guiclass="TestBeanGUI" testclass="DebugSampler" testname="" enabled="true">
              <boolProp name="displayJMeterProperties" />
              <boolProp name="displayJMeterVariables" />
              <boolProp name="displaySystemProperties" />
            </DebugSampler>
          XML
        end
      end
    end
  end
end
