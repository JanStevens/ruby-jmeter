module RubyJmeter
  module Nodes
    module Assertations
      class CompareAssertion < Nodes::Base
        defaults compare_time: -1, compare_content: true
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.CompareAssertion guiclass: 'TestBeanGUI', testclass: 'CompareAssertion',
              testname: attributes[:test_name], enabled: attributes[:enabled] do
              bool(xml, attributes[:compare_content], name: 'compareContent')
              long(xml, attributes[:compare_time], name: 'compareTime')
              collection(xml, name: 'stringsToSkip') do
                Array(attributes[:strings_to_skip]).each do |skip|
                  element(xml, name: '', elementType: 'SubstitutionElement') do
                    string(xml, skip[:regex], name: 'regex')
                    string(xml, skip[:substitute], name: 'substitute')
                  end
                end
              end
            end
          end.doc
        end
      end
    end
  end
end
