module RubyJmeter
  module Nodes
    module PreProcessors
      class Jsr223Preprocessor < Nodes::Base
        allowed %i(cacheKey filename parameters script scriptLanguage)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <JSR223PreProcessor guiclass="TestBeanGUI" testclass="JSR223PreProcessor" testname="" enabled="true">
            <stringProp name="cacheKey"/>
            <stringProp name="filename"/>
            <stringProp name="parameters"/>
            <stringProp name="script"/>
            <stringProp name="scriptLanguage"/>
          </JSR223PreProcessor>
          XML
        end
      end
    end
  end
end
