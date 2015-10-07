module RubyJmeter
  module Nodes
    module PostProcessors
      class ResultStatusActionHandler < Nodes::Base
        allowed :action
        defaults action: 0

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <ResultAction guiclass="ResultActionGui" testclass="ResultAction" testname="" enabled="true">
              <intProp name="OnError.action" />
            </ResultAction>
          XML
        end
      end
    end
  end
end
