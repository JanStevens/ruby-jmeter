module RubyJmeter
  module Nodes
    module PostProcessors
      class XpathExtractor < Nodes::Base
        defaults validate: false, tolerant: false, namespace: false
        allowed %i(default refname xpathQuery validate tolerant namespace)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <XPathExtractor guiclass="XPathExtractorGui" testclass="XPathExtractor" testname="" enabled="true">
            <stringProp name="XPathExtractor.default"/>
            <stringProp name="XPathExtractor.refname"/>
            <stringProp name="XPathExtractor.xpathQuery"/>
            <boolProp name="XPathExtractor.validate" />
            <boolProp name="XPathExtractor.tolerant" />
            <boolProp name="XPathExtractor.namespace" />
          </XPathExtractor>
          XML
        end
      end
    end
  end
end
