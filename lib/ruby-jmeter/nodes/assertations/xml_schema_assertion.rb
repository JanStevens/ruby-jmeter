module RubyJmeter
  module Nodes
    module Listeners
      class XmlSchemaAssertion < Nodes::Base
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.XMLSchemaAssertion guiclass: "XMLSchemaAssertionGUI", testclass: "XMLSchemaAssertion",
              testname: attributes[:test_name], enabled: attributes[:enabled] do
              string(xml, attributes[:filename], name: 'xmlschema_assertion_filename')
            end
          end.doc
        end
      end
    end
  end
end
