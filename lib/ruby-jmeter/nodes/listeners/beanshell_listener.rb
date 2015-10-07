module RubyJmeter
  module Nodes
    module Listeners
      class BeanshellListener < Nodes::Base
        defaults reset_interpreter: false
        allowed %i(filename parameters reset_interpreter script)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <BeanShellListener guiclass="TestBeanGUI" testclass="BeanShellListener" testname="" enabled="true">
            <stringProp name="filename"/>
            <stringProp name="parameters"/>
            <boolProp name="resetInterpreter" />
            <stringProp name="script"/>
          </BeanShellListener>
          XML
        end
      end
    end
  end
end
