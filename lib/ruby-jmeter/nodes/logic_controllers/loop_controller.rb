module RubyJmeter
  module Nodes
    module LogicControllers
      class LoopController < Nodes::Base
        defaults continue_forever: true, loops: 1
        allowed %i(continue_forever loops)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <LoopController guiclass="LoopControlPanel" testclass="LoopController" testname="" enabled="true">
            <boolProp name="LoopController.continue_forever" />
            <stringProp name="LoopController.loops" />
          </LoopController>
          XML
        end
      end
    end
  end
end
