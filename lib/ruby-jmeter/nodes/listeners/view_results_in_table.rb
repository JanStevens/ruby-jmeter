module RubyJmeter
  module Nodes
    module Listeners
      class ViewResultsInTable < Nodes::Base
        defaults error_logging: false
        allowed %i(error_logging filename)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <ResultCollector guiclass="TableVisualizer" testclass="ResultCollector" testname="" enabled="true">
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
            <stringProp name="filename"/>
          </ResultCollector>
          XML
        end
      end
    end
  end
end
