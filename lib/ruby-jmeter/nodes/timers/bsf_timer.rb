module RubyJmeter
  module Nodes
    module Times
      class BsfTimer < Nodes::Base
        allowed %i(filename parameters script scriptLanguage)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <BSFTimer guiclass="TestBeanGUI" testclass="BSFTimer" testname="" enabled="true">
            <stringProp name="filename"/>
            <stringProp name="parameters"/>
            <stringProp name="script"/>
            <stringProp name="scriptLanguage"/>
          </BSFTimer>
          XML
        end
      end
    end
  end
end
