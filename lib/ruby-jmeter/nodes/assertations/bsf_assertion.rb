module RubyJmeter
  module Nodes
    module Assertations
      class BsfAssertion < Nodes::Base
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.BSFAssertion guiclass: 'TestBeanGUI', testclass: 'BSFAssertion', testname: attributes[:test_name], enabled: attributes[:enabled] do
              string(xml, attributes[:filename], name: 'filename')
              string(xml, attributes[:parameters], name: 'parameters')
              string(xml, attributes[:script], name: 'script')
              string(xml, attributes[:script_language], name: 'scriptLanguage')
            end
          end.doc
        end
      end
    end
  end
end
