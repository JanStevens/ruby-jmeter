module RubyJmeter
  module Nodes
    module Times
      class SynchronizingTimer < Nodes::Base
        defaults groupSize: 0, timeoutInMs: 0
        allowed %i(groupSize timeoutInMs)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <SyncTimer guiclass="TestBeanGUI" testclass="SyncTimer" testname="" enabled="true">
            <intProp name="groupSize">0</intProp>
            <longProp name="timeoutInMs">0</longProp>
          </SyncTimer>
          XML
        end
      end
    end
  end
end
