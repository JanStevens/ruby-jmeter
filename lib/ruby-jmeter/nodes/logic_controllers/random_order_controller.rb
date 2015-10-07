module RubyJmeter
  module Nodes
    module LogicControllers
      class RandomOrderController < Nodes::Base
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <RandomOrderController guiclass="RandomOrderControllerGui" testclass="RandomOrderController" testname="" enabled="true"/>
          XML
        end
      end
    end
  end
end
