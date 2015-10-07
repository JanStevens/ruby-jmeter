module RubyJmeter
  module Nodes
    module Times
      class Jsr223Timer < Nodes::Base
        allowed %i(cacheKey filename parameters script scriptLanguage)
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <JSR223Timer guiclass="TestBeanGUI" testclass="JSR223Timer" testname="" enabled="true">
            <stringProp name="cacheKey"/>
            <stringProp name="filename"/>
            <stringProp name="parameters"/>
            <stringProp name="script"/>
            <stringProp name="scriptLanguage"/>
          </JSR223Timer>
          XML
        end
      end
    end
  end
end
