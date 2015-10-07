module RubyJmeter
  module Nodes
    module PostProcessors
      class BeanshellPostprocessor < Nodes::Base
        defaults resetInterpreter: false
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <BeanShellPostProcessor guiclass="TestBeanGUI" testclass="BeanShellPostProcessor" testname="" enabled="true">
            <stringProp name="filename" />
            <stringProp name="parameters" />
            <boolProp name="resetInterpreter" />
            <stringProp name="script" />
          </BeanShellPostProcessor>
          XML
        end
      end
    end
  end
end
