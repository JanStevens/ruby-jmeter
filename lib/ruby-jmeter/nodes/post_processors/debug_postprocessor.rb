module RubyJmeter
  module Nodes
    module PostProcessors
      class DebugPostprocessor < Nodes::Base
        allowed %i(displayJMeterProperties displayJMeterVariables displaySamplerProperties
          displaySystemProperties)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <DebugPostProcessor guiclass="TestBeanGUI" testclass="DebugPostProcessor" testname="" enabled="true">
            <boolProp name="displayJMeterProperties">false</boolProp>
            <boolProp name="displayJMeterVariables">true</boolProp>
            <boolProp name="displaySamplerProperties">true</boolProp>
            <boolProp name="displaySystemProperties">false</boolProp>
          </DebugPostProcessor>
          XML
        end
      end
    end
  end
end
