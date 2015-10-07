module RubyJmeter
  module Nodes
    module Listeners
      class Jsr223Assertion < Nodes::Base
        allowed %i(script_language parameters filename cache_key script)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <JSR223Assertion guiclass="TestBeanGUI" testclass="JSR223Assertion" testname="" enabled="true">
            <stringProp name="scriptLanguage"/>
            <stringProp name="parameters"/>
            <stringProp name="filename"/>
            <stringProp name="cacheKey"/>
            <stringProp name="script"/>
          </JSR223Assertion>
          XML
        end
      end
    end
  end
end
