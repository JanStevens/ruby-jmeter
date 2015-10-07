module RubyJmeter
  module Nodes
    module Listeners
      class Jsr223Listener < Nodes::Base
        allowed %i(cache_key filename parameters script script_language)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <JSR223Listener guiclass="TestBeanGUI" testclass="JSR223Listener" testname="" enabled="true">
            <stringProp name="cacheKey"/>
            <stringProp name="filename"/>
            <stringProp name="parameters"/>
            <stringProp name="script"/>
            <stringProp name="scriptLanguage"/>
          </JSR223Listener>
          XML
        end
      end
    end
  end
end
