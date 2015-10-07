module RubyJmeter
  module Nodes
    module LogicControllers
      class CriticalSectionController < Nodes::Base
        defaults lock_name: 'global_lock'
        allowed %i(lock_name)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <CriticalSectionController guiclass="CriticalSectionControllerGui" testclass="CriticalSectionController" testname="Critical Section Controller" enabled="true">
            <stringProp name="CriticalSectionController.lockName" />
          </CriticalSectionController>
          XML
        end
      end
    end
  end
end
