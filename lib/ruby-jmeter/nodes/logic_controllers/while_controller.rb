module RubyJmeter
  module Nodes
    module LogicControllers
      class WhileController < Nodes::Base
        allowed :condition

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <WhileController guiclass="WhileControllerGui" testclass="WhileController" testname="" enabled="true">
              <stringProp name="WhileController.condition"/>
            </WhileController>
          XML
        end
      end
    end
  end
end
