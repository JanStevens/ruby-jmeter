module RubyJmeter
  module Nodes
    module PreProcessors
      class BsfPreprocessor < Nodes::Base
        allowed %i(filename parameters script scriptLanguage)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <BSFPreProcessor guiclass="TestBeanGUI" testclass="BSFPreProcessor" testname="" enabled="true">
            <stringProp name="filename"/>
            <stringProp name="parameters"/>
            <stringProp name="script"/>
            <stringProp name="scriptLanguage"/>
          </BSFPreProcessor>
          XML
        end
      end
    end
  end
end
