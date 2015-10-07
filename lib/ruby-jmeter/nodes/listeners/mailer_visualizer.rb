module RubyJmeter
  module Nodes
    module Listeners
      class MailerVisualizer < Nodes::Base
        defaults success_limit: 2, failure_limit: 2, error_logging: false
        allowed %i(error_logging mailer_model success_limit failure_limit failure_subject from_address
          smtp_host success_subject addressie)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <MailerResultCollector guiclass="MailerVisualizer" testclass="MailerResultCollector" testname="" enabled="true">
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
            <elementProp name="MailerResultCollector.mailer_model" elementType="MailerModel">
              <stringProp name="MailerModel.successLimit" />
              <stringProp name="MailerModel.failureLimit" />
              <stringProp name="MailerModel.failureSubject"/>
              <stringProp name="MailerModel.fromAddress"/>
              <stringProp name="MailerModel.smtpHost"/>
              <stringProp name="MailerModel.successSubject"/>
              <stringProp name="MailerModel.addressie"/>
            </elementProp>
            <stringProp name="filename"/>
          </MailerResultCollector>
          XML
        end
      end
    end
  end
end
