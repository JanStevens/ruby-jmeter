module RubyJmeter
  module Nodes
    module LogicControllers
      class IncludeController < Nodes::Base
        allowed :includepath

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <IncludeController guiclass="IncludeControllerGui" testclass="IncludeController" testname="" enabled="true">
            <stringProp name="IncludeController.includepath"/>
          </IncludeController>
          XML
        end
      end
    end
  end
end
