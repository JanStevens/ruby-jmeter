module RubyJmeter
  module Nodes
    module PostProcessors
      class Jsr223Postprocessor < Nodes::Base
        allowed %i(cacheKey filename parameters script scriptLanguage)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <JSR223PostProcessor guiclass="TestBeanGUI" testclass="JSR223PostProcessor" testname="" enabled="true">
              <stringProp name="cacheKey"/>
              <stringProp name="filename"/>
              <stringProp name="parameters"/>
              <stringProp name="script"/>
              <stringProp name="scriptLanguage"/>
            </JSR223PostProcessor>
          XML
        end
      end
    end
  end
end
