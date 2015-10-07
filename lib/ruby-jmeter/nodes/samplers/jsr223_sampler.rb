module RubyJmeter
  module Nodes
    module Samplers
      class Jsr223Sampler < Nodes::Base
        allowed %i(cacheKey filename parameters script scriptLanguage)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <JSR223Sampler guiclass="TestBeanGUI" testclass="JSR223Sampler" testname="" enabled="true">
            <stringProp name="cacheKey"/>
            <stringProp name="filename"/>
            <stringProp name="parameters"/>
            <stringProp name="script"/>
            <stringProp name="scriptLanguage"/>
          </JSR223Sampler>
          XML
        end
      end
    end
  end
end
