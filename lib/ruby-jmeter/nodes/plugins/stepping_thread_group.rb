module RubyJmeter
  module Nodes
    module Plugins
      class SteppingThreadGroup < Nodes::Base
        allowed [:on_sample_error, :num_threads, :'Threads initial delay', :'Start users count',
          :'Start users count burst', :'Start users period', :'Stop users count', :'Stop users period',
          :flighttime, :rampUp, :continue_forever, :loops]
        defaults on_sample_error: 'continue', continue_forever: false, loops: -1
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <kg.apc.jmeter.threads.SteppingThreadGroup guiclass="kg.apc.jmeter.threads.SteppingThreadGroupGui" testclass="kg.apc.jmeter.threads.SteppingThreadGroup" testname="" enabled="true">
            <stringProp name="ThreadGroup.on_sample_error" />
            <stringProp name="ThreadGroup.num_threads" />
            <stringProp name="Threads initial delay" />
            <stringProp name="Start users count" />
            <stringProp name="Start users count burst" />
            <stringProp name="Start users period" />
            <stringProp name="Stop users count" />
            <stringProp name="Stop users period" />
            <stringProp name="flighttime" />
            <stringProp name="rampUp" />
            <elementProp name="ThreadGroup.main_controller" elementType="LoopController" guiclass="LoopControlPanel" testclass="LoopController" testname="Loop Controller" enabled="true">
              <boolProp name="LoopController.continue_forever" />
              <intProp name="LoopController.loops" />
            </elementProp>
          </kg.apc.jmeter.threads.SteppingThreadGroup>
          XML
        end
      end
    end
  end
end
