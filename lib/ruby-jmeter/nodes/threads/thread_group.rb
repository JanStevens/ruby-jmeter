module RubyJmeter
  module Nodes
    module Threads
      class ThreadGroup < Nodes::Base
        defaults on_sample_error: 'continue', continue_forever: false, loops: -1,
          num_threads: 1, ramp_time: 1, scheduler: false, delayed_start: true,
          start_time: Time.now.to_i * 1000, end_time: Time.now.to_i * 1000
        allowed %i(on_sample_error continue_forever loops num_threads ramp_time start_time
         end_time scheduler duration delay delayed_start)

        mapping delayed_start: :delayedStart
        skip_conversion!

        def node
          #params[:start_time] = params[:start_time] || Time.now.to_i * 1000
          #params[:end_time] = params[:end_time] || Time.now.to_i * 1000
          # test = Nokogiri::XML::Builder.new do |xml|
          #   xml.ThreadGroup guiclass: 'ThreadGroupGui', testclass: 'ThreadGroup', testname: params[:name], enabled: params[:enabled] do
          #     string xml, params[:on_sample_error], name: 'ThreadGroup.on_sample_error'
          #     element xml, name: 'ThreadGroup.main_controller', elementType: 'LoopController', guiclass: 'LoopControlPanel', testclass: 'LoopController', testname: params[:name], enabled: true do
          #       bool xml, params[:continue_forever], name: 'LoopController.continue_forever'
          #       int xml, params[:loops], name: 'LoopController.loops'
          #     end
          #     string xml, params[:num_threads], name: 'ThreadGroup.num_threads'
          #     string xml, params[:ramp_time], name: 'ThreadGroup.ramp_time'
          #     long xml, params[:start_time], name: 'ThreadGroup.start_time'
          #     long xml, params[:end_time], name: 'ThreadGroup.end_time'
          #     bool xml, params[:scheduler], name: 'ThreadGroup.scheduler'
          #     string xml, params[:duration], name: 'ThreadGroup.duration'
          #     string xml, params[:delay], name: 'ThreadGroup.dely'
          #     bool xml, params[:delayedStart], name: 'ThreadGroup.delayedStart'
          #   end
          # end

         Nokogiri::XML(<<-XML.strip_heredoc)
          <ThreadGroup guiclass="ThreadGroupGui" testclass="ThreadGroup" testname="" enabled="true">
            <stringProp name="ThreadGroup.on_sample_error" />
            <elementProp name="ThreadGroup.main_controller" elementType="LoopController" guiclass="LoopControlPanel" testclass="LoopController" testname="" enabled="true">
              <boolProp name="LoopController.continue_forever" />
              <intProp name="LoopController.loops" />
            </elementProp>
            <stringProp name="ThreadGroup.num_threads" />
            <stringProp name="ThreadGroup.ramp_time" />
            <longProp name="ThreadGroup.start_time" />
            <longProp name="ThreadGroup.end_time" />
            <boolProp name="ThreadGroup.scheduler" />
            <stringProp name="ThreadGroup.duration"/>
            <stringProp name="ThreadGroup.delay"/>
            <boolProp name="ThreadGroup.delayedStart" />
          </ThreadGroup>
          XML
        end
      end
    end
  end
end
