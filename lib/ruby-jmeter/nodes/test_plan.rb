module RubyJmeter
  module Nodes
    # user_variables: [ name: 'value', name_2: 'value_2' ]
    class TestPlan < Nodes::Base
      defaults functional_mode: false, serialize_threadgroups: false
      uses_new_syntax!

      def node
        Nokogiri::XML::Builder.new do |xml|
          root_node(xml) do
            string(xml, attributes[:comments], name: 'TestPlan.comments')
            bool(xml, attributes[:functional_mode], name: 'TestPlan.functional_mode')
            bool(xml, attributes[:serialize_threadgroups], name: 'TestPlan.serialize_threadgroups')
            user_defined_variables(xml) do
              collection(xml, name: 'Arguments.arguments') do
                Array(attributes[:user_variables]).each do |name, value|
                  element(xml, name: name, elementType: 'Argument') do
                    string(xml, name, name: 'Argument.name')
                    string(xml, value, name: 'Argument.value')
                    string(xml, '=', name: 'Argument.metadata')
                  end
                end
              end
            end
            string(xml, attributes[:class_path], name: 'TestPlan.user_defined_classpath')
          end
        end.doc
      end

      def user_defined_variables(xml, &block)
        element(xml, name: "TestPlan.user_defined_variables",
          elementType: "Arguments",
          guiclass: "ArgumentsPanel",
          testclass: "Arguments",
          enabled: "true", &block)
      end

      def root_node(xml, &block)
        xml.TestPlan(guiclass: 'TestPlanGui',
          testclass: 'TestPlan',
          testname: attributes[:test_name],
          enabled: attributes[:enabled], &block)
      end
    end
  end
end
