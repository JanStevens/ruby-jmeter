module RubyJmeter
  module Nodes
    module Listeners
      class BsfListener < Nodes::Base
        allowed %i(filename parameters script script_language)
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <BSFListener guiclass="TestBeanGUI" testclass="BSFListener" testname="" enabled="true">
            <stringProp name="filename"/>
            <stringProp name="parameters"/>
            <stringProp name="script"/>
            <stringProp name="scriptLanguage"/>
          </BSFListener>
          XML
        end
      end
    end
  end
end
