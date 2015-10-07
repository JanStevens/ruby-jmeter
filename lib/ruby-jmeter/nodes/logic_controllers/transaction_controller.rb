module RubyJmeter
  module Nodes
    module LogicControllers
      class TransactionController < Nodes::Base
        defaults parent: true, include_timers: false
        allowed %i(parent include_timers)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <TransactionController guiclass="TransactionControllerGui" testclass="TransactionController" testname="" enabled="true">
            <boolProp name="TransactionController.parent" />
            <boolProp name="TransactionController.includeTimers" />
          </TransactionController>
          XML
        end
      end
    end
  end
end
