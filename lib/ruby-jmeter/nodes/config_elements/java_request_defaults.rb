module RubyJmeter
  module Nodes
    module ConfigElements
      class JavaRequestDefaults < Nodes::Base
        defaults classname: 'org.apache.jmeter.protocol.java.test.JavaTest'
        uses_new_syntax!

        def node
          arguments = Array(attributes[:arguments])
          Nokogiri::XML::Builder.new do |xml|
            xml.JavaConfig guiclass: "JavaConfigGui", testclass: "JavaConfig",
              testname: attributes[:test_name], enabled: attributes[:enabled] do
                collection(name: 'Arguments.arguments') do
                  arguments.each do |arg|
                    element(name: arg[:name], elementType: 'Argument') do
                      string(xml, arg[:name], name: 'Argument.name')
                      string(xml, arg[:value], name: 'Argument.value')
                      string(xml, '=', name: 'Argument.metadata')
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
