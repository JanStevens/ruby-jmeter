module RubyJmeter
  module Nodes
    module LogicControllers
      class RuntimeController < Nodes::Base
        defaults seconds: 1
        allowed :seconds
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <RunTime guiclass="RunTimeGui" testclass="RunTime" testname="" enabled="true">
            <stringProp name="RunTime.seconds" />
          </RunTime>
          XML
        end
      end
    end
  end
end
