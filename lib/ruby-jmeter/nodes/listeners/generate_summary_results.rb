module RubyJmeter
  module Nodes
    module Listeners
      class GenerateSummaryResults < Nodes::Base
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
        <Summariser guiclass="SummariserGui" testclass="Summariser" testname="" enabled="true"/>
          XML
        end
      end
    end
  end
end
