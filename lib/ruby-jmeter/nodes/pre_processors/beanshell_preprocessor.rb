module RubyJmeter
  module Nodes
    module PreProcessors
      class BeanshellPreprocessor < Nodes::Base
        defaults resetInterpreter: false
        allowed %i(filename paremeters resetInterpreter script)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <BeanShellPreProcessor guiclass="TestBeanGUI" testclass="BeanShellPreProcessor" testname="" enabled="true">
            <stringProp name="filename"/>
            <stringProp name="parameters"/>
            <boolProp name="resetInterpreter" />
            <stringProp name="script"/>
          </BeanShellPreProcessor>
          XML
        end
      end
    end
  end
end
