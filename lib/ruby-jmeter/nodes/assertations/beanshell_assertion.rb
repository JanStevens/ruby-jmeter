module RubyJmeter
  module Nodes
    module Assertations
      class BeanshellAssertion < Nodes::Base
        defaults reset_interpreter: false
        allowed %i(query filename parameters reset_interpreter)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <BeanShellAssertion guiclass="BeanShellAssertionGui" testclass="BeanShellAssertion" testname="" enabled="true">
            <stringProp name="BeanShellAssertion.query"/>
            <stringProp name="BeanShellAssertion.filename"/>
            <stringProp name="BeanShellAssertion.parameters"/>
            <boolProp name="BeanShellAssertion.resetInterpreter" />
          </BeanShellAssertion>
          XML
        end
      end
    end
  end
end
