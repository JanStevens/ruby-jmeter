module RubyJmeter
  module Nodes
    module LogicControllers
      class SimpleController < Nodes::Base
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <GenericController guiclass="LogicControllerGui" testclass="GenericController" testname="" enabled="true"/>)
          XML
        end
      end
    end
  end
end
