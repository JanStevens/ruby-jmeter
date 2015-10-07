module RubyJmeter
  module Nodes
    module Listeners
      class XpathAssertion < Nodes::Base
        defaults negate: false, xpath: '/', validate: false, whitespace: false,
          tolerant: false, namespace: false
        allowed %i(negate xpath validate whitespace tolerant namespace)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <XPathAssertion guiclass="XPathAssertionGui" testclass="XPathAssertion" testname="" enabled="true">
            <boolProp name="XPath.negate" />
            <stringProp name="XPath.xpath" />
            <boolProp name="XPath.validate" />
            <boolProp name="XPath.whitespace" />
            <boolProp name="XPath.tolerant" />
            <boolProp name="XPath.namespace" />
          </XPathAssertion>
          XML
        end
      end
    end
  end
end

