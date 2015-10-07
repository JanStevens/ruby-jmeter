module RubyJmeter
  module Nodes
    module LogicControllers
      class IfController < Nodes::Base
        defaults evaluate_all: false, use_expression: true
        allowed %i(condition evaluate_all use_expression)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <IfController guiclass="IfControllerPanel" testclass="IfController" testname="" enabled="true">
              <stringProp name="IfController.condition"/>
              <boolProp name="IfController.evaluateAll" />
              <boolProp name="IfController.useExpression" />
            </IfController>
          XML
        end
      end
    end
  end
end
