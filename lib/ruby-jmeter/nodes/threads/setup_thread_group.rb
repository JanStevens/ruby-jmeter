module RubyJmeter
  module Nodes
    module Threads
      class SetupThreadGroup < Nodes::Base
        defaults on_sample_error: 'continue', continue_forever: false, loops: -1, num_threads: 1,
          ramp_time: 1, scheduler: true
        allowed %i(on_sample_error continue_forever loops num_threads ramp_time start_time end_time
          scheduler duration delay)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <SetupThreadGroup guiclass="SetupThreadGroupGui" testclass="SetupThreadGroup" testname="" enabled="true">
            <stringProp name="ThreadGroup.on_sample_error" />
            <elementProp name="ThreadGroup.main_controller" elementType="LoopController" guiclass="LoopControlPanel" testclass="LoopController" testname="" enabled="true">
              <boolProp name="LoopController.continue_forever" />
              <stringProp name="LoopController.loops" />
            </elementProp>
            <stringProp name="ThreadGroup.num_threads" />
            <stringProp name="ThreadGroup.ramp_time" />
            <longProp name="ThreadGroup.start_time" />
            <longProp name="ThreadGroup.end_time" />
            <boolProp name="ThreadGroup.scheduler" />
            <stringProp name="ThreadGroup.duration" />
            <stringProp name="ThreadGroup.delay" />
          </SetupThreadGroup>
          XML
        end
      end
    end
  end
end
