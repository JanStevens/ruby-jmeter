module RubyJmeter
  module Nodes
    module ConfigElements
      class Counter < Nodes::Base
        defaults per_user: true, reset_on_tg_iteration: true
        allowed %i(start end incr name format per_user reset_on_tg_iteration)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <CounterConfig guiclass="CounterConfigGui" testclass="CounterConfig" testname="" enabled="true">
            <stringProp name="CounterConfig.start" />
            <stringProp name="CounterConfig.end" />
            <stringProp name="CounterConfig.incr" />
            <stringProp name="CounterConfig.name" />
            <stringProp name="CounterConfig.format" />
            <boolProp name="CounterConfig.per_user" />
            <boolProp name="CounterConfig.reset_on_tg_iteration" />
          </CounterConfig>
          XML
        end
      end
    end
  end
end
