module RubyJmeter
  module Nodes
    module ConfigElements
      class JavaRequestDefaults < Nodes::Base
        defaults classname: 'org.apache.jmeter.protocol.java.test.JavaTest'
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <JavaConfig guiclass="JavaConfigGui" testclass="JavaConfig" testname="" enabled="true">
            <elementProp name="arguments" elementType="Arguments" guiclass="ArgumentsPanel" testclass="Arguments" enabled="true">
              <collectionProp name="Arguments.arguments">
                <elementProp name="Sleep_Time" elementType="Argument">
                  <stringProp name="Argument.name">Sleep_Time</stringProp>
                  <stringProp name="Argument.value">100</stringProp>
                  <stringProp name="Argument.metadata">=</stringProp>
                </elementProp>
                <elementProp name="Sleep_Mask" elementType="Argument">
                  <stringProp name="Argument.name">Sleep_Mask</stringProp>
                  <stringProp name="Argument.value">0xFF</stringProp>
                  <stringProp name="Argument.metadata">=</stringProp>
                </elementProp>
                <elementProp name="Label" elementType="Argument">
                  <stringProp name="Argument.name">Label</stringProp>
                  <stringProp name="Argument.value"/>
                  <stringProp name="Argument.metadata">=</stringProp>
                </elementProp>
                <elementProp name="ResponseCode" elementType="Argument">
                  <stringProp name="Argument.name">ResponseCode</stringProp>
                  <stringProp name="Argument.value"/>
                  <stringProp name="Argument.metadata">=</stringProp>
                </elementProp>
                <elementProp name="ResponseMessage" elementType="Argument">
                  <stringProp name="Argument.name">ResponseMessage</stringProp>
                  <stringProp name="Argument.value"/>
                  <stringProp name="Argument.metadata">=</stringProp>
                </elementProp>
                <elementProp name="Status" elementType="Argument">
                  <stringProp name="Argument.name">Status</stringProp>
                  <stringProp name="Argument.value">OK</stringProp>
                  <stringProp name="Argument.metadata">=</stringProp>
                </elementProp>
                <elementProp name="SamplerData" elementType="Argument">
                  <stringProp name="Argument.name">SamplerData</stringProp>
                  <stringProp name="Argument.value"/>
                  <stringProp name="Argument.metadata">=</stringProp>
                </elementProp>
                <elementProp name="ResultData" elementType="Argument">
                  <stringProp name="Argument.name">ResultData</stringProp>
                  <stringProp name="Argument.value"/>
                  <stringProp name="Argument.metadata">=</stringProp>
                </elementProp>
              </collectionProp>
            </elementProp>
            <stringProp name="classname" />
          </JavaConfig>
          XML
        end
      end
    end
  end
end
