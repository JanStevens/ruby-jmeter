module RubyJmeter
  module Nodes
    module Samplers
      class DebugSampler < Nodes::Base
        defaults properties: false, variables: true, system: true
        allowed %i(properties variables system)
        mapping properties: :displayJMeterProperties, variables: :displayJMeterVariables, system: :displaySystemProperties

        skip_conversion!

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
