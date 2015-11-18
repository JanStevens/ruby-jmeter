module RubyJmeter
  module Nodes
    module Listeners
      class Md5hexAssertion < Nodes::Base
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.MD5HexAssertion guiclass: "MD5HexAssertionGUI", testclass: "MD5HexAssertion",
              testname: attributes[:test_name], enabled: attributes[:enabled] do
              string(xml, attributes[:size], name: 'MD5HexAssertion.size')
            end
          end.doc
        end
      end
    end
  end
end
