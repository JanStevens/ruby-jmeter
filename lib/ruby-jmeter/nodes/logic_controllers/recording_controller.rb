module RubyJmeter
  module Nodes
    module LogicControllers
      class RecordingController < Nodes::Base
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <RecordingController guiclass="RecordController" testclass="RecordingController" testname="" enabled="true"/>)
          XML
        end
      end
    end
  end
end
