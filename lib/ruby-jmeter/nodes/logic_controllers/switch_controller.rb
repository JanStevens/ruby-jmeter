module RubyJmeter
  module Nodes
    module LogicControllers
      class SwitchController < Nodes::Base
        allowed :value

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <SwitchController guiclass="SwitchControllerGui" testclass="SwitchController" testname="" enabled="true">
            <stringProp name="SwitchController.value" />
          </SwitchController>
          XML
        end
      end
    end
  end
end
