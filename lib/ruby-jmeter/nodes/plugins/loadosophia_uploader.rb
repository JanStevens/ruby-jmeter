module RubyJmeter
  module Nodes
    module Plugins
      class LoadosophiaUploader < Nodes::Base
        defaults error_logging: false, project: 'DEFAULT', uploadToken: 'INVALID', storeDir: '/tmp',
          color: 'none', useOnline: false
        allowed %i(error_logging filename project uploadToken storeDir color title useOnline)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <kg.apc.jmeter.reporters.LoadosophiaUploader guiclass="kg.apc.jmeter.reporters.LoadosophiaUploaderGui" testclass="kg.apc.jmeter.reporters.LoadosophiaUploader" testname="" enabled="#{enabled(params)}">
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
            <stringProp name="filename" />
            <stringProp name="project" />
            <stringProp name="uploadToken" />
            <stringProp name="storeDir" />
            <stringProp name="color" />
            <stringProp name="title" />
            <boolProp name="useOnline" />
          </kg.apc.jmeter.reporters.LoadosophiaUploader>
          XML
        end
      end
    end
  end
end

