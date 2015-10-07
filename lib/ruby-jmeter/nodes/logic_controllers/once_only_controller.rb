module RubyJmeter
  module Nodes
    module LogicControllers
      class OnceOnlyController < Nodes::Base

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
        <OnceOnlyController guiclass="OnceOnlyControllerGui" testclass="OnceOnlyController" testname="" enabled="true"/>
          XML
        end
      end
    end
  end
end
