module RubyJmeter
  module Nodes
    module PostProcessors
      class BsfPostprocessor < Nodes::Base
        allowed %i(filename paremeters script scriptLanguage)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <BSFPostProcessor guiclass="TestBeanGUI" testclass="BSFPostProcessor" testname="" enabled="true">
            <stringProp name="filename"/>
            <stringProp name="parameters"/>
            <stringProp name="script"/>
            <stringProp name="scriptLanguage"/>
          </BSFPostProcessor>
          XML
        end
      end
    end
  end

end
