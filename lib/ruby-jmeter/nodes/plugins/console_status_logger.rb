module RubyJmeter
  module Nodes
    module Plugins
      class ConsoleStatusLogger < Nodes::Base
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <kg.apc.jmeter.reporters.ConsoleStatusLogger guiclass="kg.apc.jmeter.reporters.ConsoleStatusLoggerGui" testclass="kg.apc.jmeter.reporters.ConsoleStatusLogger" testname="" enabled="true"/>
          XML
        end
      end
    end
  end
end
