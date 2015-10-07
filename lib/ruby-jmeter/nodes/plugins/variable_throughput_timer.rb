module RubyJmeter
  module Nodes
    module Plugins
      # @TODO colletionProp
      class ThroughputShapingTimer < Nodes::Base
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <kg.apc.jmeter.timers.VariableThroughputTimer guiclass="kg.apc.jmeter.timers.VariableThroughputTimerGui" testclass="kg.apc.jmeter.timers.VariableThroughputTimer" testname="" enabled="true">
            <collectionProp name="load_profile"/>
          </kg.apc.jmeter.timers.VariableThroughputTimer>
          XML
          steps.each_with_index do |step, index|
            @doc.at_xpath('//collectionProp') <<
              Nokogiri::XML(<<-XML.strip_heredoc).children
              <collectionProp name="step_#{index}">
                <stringProp name="start_rps_#{index}">#{step[:start_rps]}</stringProp>
                <stringProp name="end_rps_#{index}">#{step[:end_rps]}</stringProp>
                <stringProp name="duration_sec_#{index}">#{step[:duration]}</stringProp>
              </collectionProp>
            XML
          end
        end
      end
    end
  end
end
