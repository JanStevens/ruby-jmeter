module RubyJmeter
  module Nodes
    module ConfigElements
      class HttpHeaderManager < Nodes::Base
        uses_new_syntax!

        def node
          headers = Array(attributes[:headers])
          Nokogiri::XML::Builder.new do |xml|
            xml.HeaderManager guiclass: "HeaderPanel", testclass: "HeaderManager",
              testname: attributes[:test_name], enabled: attributes[:enabled] do
              collection(xml, name: 'HeaderManager.headers') do
                headers.each do |header|
                  element(xml, name: '', elementType: 'Header') do
                    string(xml, header[:header], name: 'Header.name')
                    string(xml, header[:value], name: 'Header.value')
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
