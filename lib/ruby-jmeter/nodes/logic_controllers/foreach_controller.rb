module RubyJmeter
  module Nodes
    module LogicControllers
      class ForeachController < Nodes::Base
        defaults use_seperator: true
        allowed %i(input_value return_value use_seperator start_index end_index)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <ForeachController guiclass="ForeachControlPanel" testclass="ForeachController" testname="" enabled="true">
            <stringProp name="ForeachController.inputVal"/>
            <stringProp name="ForeachController.returnVal"/>
            <boolProp name="ForeachController.useSeparator" />
            <stringProp name="ForeachController.startIndex"/>
            <stringProp name="ForeachController.endIndex"/>
          </ForeachController>
          XML
        end
      end
    end
  end
end
