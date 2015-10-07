module RubyJmeter
  module Nodes
    module Plugins
      # @TODO objProp, COMPOSITE_CFG
      class CompositeGraph < Nodes::Base
        defaults error_logging: false, interval_grouping: 500, graph_aggregated: false, include_checkbox_state: false,
          exclude_checkbox_state: false

        allowed %i(error_logging filename interval_grouping graph_aggregated include_sample_labels
          exclude_sample_labels start_offset end_offset include_checkbox_state exclude_checkbox_state)

        def node
          graphNodes = params.collect { |g| "<stringProp name=\"\">#{g[:graph]}</stringProp>" }
          metricNodes = params.collect { |m| "<stringProp name=\"\">#{m[:metric]}</stringProp>" }

          composite_collections = Nokogiri::XML(<<-XML.strip_heredoc)
          <collectionProp name="COMPOSITE_CFG">
            <collectionProp name="">
                #{graphNodes.join("\n") }
            </collectionProp>
            <collectionProp name="">
                #{metricNodes.join("\n") }
            </collectionProp>
          </collectionProp>
          XML

          Nokogiri::XML(<<-XML.strip_heredoc)
          <kg.apc.jmeter.vizualizers.CompositeResultCollector guiclass="kg.apc.jmeter.vizualizers.CompositeGraphGui" testclass="kg.apc.jmeter.vizualizers.CompositeResultCollector" testname="" enabled="true">
            <boolProp name="ResultCollector.error_logging">false</boolProp>
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
                <xml>false</xml>
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
            #{composite_collections.root.to_s}
          </kg.apc.jmeter.vizualizers.CompositeResultCollector>
          XML
        end
      end
    end
  end
end

