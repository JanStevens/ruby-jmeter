module RubyJmeter
  module Nodes
    module ConfigElements
      class RandomVariable < Nodes::Base
        defaults maximum_value: 1, per_thread: false
        allowed %i(maximum_value minimum_value output_format per_thread random_seed variable_name)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <RandomVariableConfig guiclass="TestBeanGUI" testclass="RandomVariableConfig" testname="" enabled="true">
              <stringProp name="maximumValue"/>
              <stringProp name="minimumValue" />
              <stringProp name="outputFormat"/>
              <boolProp name="perThread" />
              <stringProp name="randomSeed"/>
              <stringProp name="variableName"/>
            </RandomVariableConfig>
          XML
        end
      end
    end
  end
end
