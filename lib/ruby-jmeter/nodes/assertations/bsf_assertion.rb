module RubyJmeter
  module Nodes
    module Assertations
      class BsfAssertion < Nodes::Base
        allowed %i(filename parameters script script_language)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
         <BSFAssertion guiclass="TestBeanGUI" testclass="BSFAssertion" testname="" enabled="true">
          <stringProp name="filename"/>
          <stringProp name="parameters"/>
          <stringProp name="script"/>
          <stringProp name="scriptLanguage"/>
         </BSFAssertion>
          XML
        end
      end
    end
  end
end
