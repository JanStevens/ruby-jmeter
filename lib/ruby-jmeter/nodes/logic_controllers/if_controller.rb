module RubyJmeter
  module Nodes
    module LogicControllers
      class IfController < Nodes::Base
        defaults evaluate_all: false, js_expression: false
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            root_node(xml) do
              string(xml, attributes[:condition], name: 'IfController.condition')
              bool(xml, attributes[:evaluate_all], name: 'IfController.evaluateAll')
              bool(xml, attributes[:js_expression], name: 'IfController.useExpression')
            end
          end.doc
        end

        def root_node(xml, &block)
          xml.IfController(guiclass: 'IfControllerPanel',
            testclass: 'IfController',
            testname: attributes[:test_name],
            enabled: attributes[:enabled], &block)
        end
      end
    end
  end
end
