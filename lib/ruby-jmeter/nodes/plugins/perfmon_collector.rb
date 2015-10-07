module RubyJmeter
  module Nodes
    module Plugins
      # @TODO objProp, collectionProp
      class PerfmonCollector < Nodes::Base
        allowed %i(error_logging server port metric parameters filename interval_grouping graph_aggregated
          include_sample_labels exclude_sample_labels start_offset end_offset include_checkbox_state
          exclude_checkbox_state)

        defaults error_logging: false, interval_grouping: 1000, graph_aggregated: false, include_checkbox_state: false,
          exclude_checkbox_state: false

        def node
          metricNodes = params.collect do |m|
            "
            <collectionProp name=\"\">
              <stringProp name=\"\">#{m[:server]}</stringProp>
              <stringProp name=\"\">#{m[:port]}</stringProp>
              <stringProp name=\"\">#{m[:metric]}</stringProp>
              <stringProp name=\"\">#{m[:parameters]}</stringProp>
            </collectionProp>
          "
          end

          metricConnections = Nokogiri::XML(<<-XML.strip_heredoc)
          <collectionProp name="metricConnections">
              #{metricNodes.join "\n"}
          </collectionProp>
          XML

          Nokogiri::XML(<<-XML.strip_heredoc)
          <kg.apc.jmeter.perfmon.PerfMonCollector guiclass="kg.apc.jmeter.vizualizers.PerfMonGui" testclass="kg.apc.jmeter.perfmon.PerfMonCollector" testname="" enabled="true">
            <boolProp name="ResultCollector.error_logging" />
            <objProp>
              <name>saveConfig</name>
              <value class="SampleSaveConfiguration">
                <time>true</time>
                <latency>true</latency>
                <timestamp>true</timestamp>
                <success>true</success>
                <label>true</label>
                <code>true</code>
                <message>false</message>
                <threadName>true</threadName>
                <dataType>false</dataType>
                <encoding>false</encoding>
                <assertions>false</assertions>
                <subresults>false</subresults>
                <responseData>false</responseData>
                <samplerData>false</samplerData>
                <xml>true</xml>
                <fieldNames>false</fieldNames>
                <responseHeaders>false</responseHeaders>
                <requestHeaders>false</requestHeaders>
                <responseDataOnError>false</responseDataOnError>
                <saveAssertionResultsFailureMessage>false</saveAssertionResultsFailureMessage>
                <assertionsResultsToSave>0</assertionsResultsToSave>
                <bytes>true</bytes>
                <threadCounts>true</threadCounts>
                <sampleCount>true</sampleCount>
              </value>
            </objProp>
            <stringProp name="filename" />
            <longProp name="interval_grouping" />
            <boolProp name="graph_aggregated" />
            <stringProp name="include_sample_labels" />
            <stringProp name="exclude_sample_labels" />
            <stringProp name="start_offset" />
            <stringProp name="end_offset" />
            <boolProp name="include_checkbox_state" />
            <boolProp name="exclude_checkbox_state" />
            #{metricConnections.root.to_s}
          </kg.apc.jmeter.perfmon.PerfMonCollector>
          XML
        end
      end
    end
  end
end
