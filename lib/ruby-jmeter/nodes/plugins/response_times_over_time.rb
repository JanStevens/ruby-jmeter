module RubyJmeter
  module Nodes
    module Plugins
      class ResponseTimesOverTime < Nodes::Base
        allowed %i(error_logging filename interval_grouping graph_aggregated include_sample_labels
          exclude_sample_labels)
        defaults error_logging: false, interval_grouping: 500, graph_aggregated: false

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <kg.apc.jmeter.vizualizers.CorrectedResultCollector guiclass="kg.apc.jmeter.vizualizers.ResponseTimesOverTimeGui" testclass="kg.apc.jmeter.vizualizers.CorrectedResultCollector" testname="" enabled="true">
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
                <message>true</message>
                <threadName>true</threadName>
                <dataType>true</dataType>
                <encoding>false</encoding>
                <assertions>true</assertions>
                <subresults>true</subresults>
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
              </value>
            </objProp>
            <stringProp name="filename" />
            <longProp name="interval_grouping" />
            <boolProp name="graph_aggregated" />
            <stringProp name="include_sample_labels" />
            <stringProp name="exclude_sample_labels" />
          </kg.apc.jmeter.vizualizers.CorrectedResultCollector>
          XML
        end
      end
    end
  end
end
