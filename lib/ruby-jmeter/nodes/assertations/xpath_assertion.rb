module RubyJmeter
  module Nodes
    module Listeners
      class XpathAssertion < Nodes::Base
        defaults negate: false, xpath: '/', validate: false, whitespace: false,
          tolerant: false, namespace: false
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.XPathAssertion guiclass: "XPathAssertionGui", testclass: "XPathAssertion",
              testname: attributes[:test_name], enabled: attributes[:enabled] do
              bool(xml, attributes[:negate], name: "XPath.negate")
              string(xml, attributes[:xpath], name: "XPath.xpath")
              bool(xml, attributes[:validate], name: "XPath.validate")
              bool(xml, attributes[:whitespace], name: "XPath.whitespace")
              bool(xml, attributes[:tolerant], name: "XPath.tolerant")
              bool(xml, attributes[:namespace], name: "XPath.namespace")
            end
          end.doc
        end
      end
    end
  end
end

