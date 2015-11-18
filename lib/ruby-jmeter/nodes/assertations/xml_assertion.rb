module RubyJmeter
  module Nodes
    module Listeners
      class XmlAssertion < Nodes::Base
        uses_new_syntax!
        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.XMLAssertion guiclass: "XMLAssertionGui", testclass: "XMLAssertion",
              testname: attributes[:test_name], enabled: attributes[:test_name]
          end.doc
        end
      end
    end
  end
end
