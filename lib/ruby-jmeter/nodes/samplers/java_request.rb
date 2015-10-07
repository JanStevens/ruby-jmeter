module RubyJmeter
  module Nodes
    module Samplers
      # @TODO Arguments.arguments solution
      class JavaRequest < Nodes::Base
        defaults classname: 'org.apache.jmeter.protocol.java.test.JavaTest'
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <JavaSampler guiclass="JavaTestSamplerGui" testclass="JavaSampler" testname="" enabled="true">
              <elementProp name="arguments" elementType="Arguments" guiclass="ArgumentsPanel" testclass="Arguments" enabled="true">
                <collectionProp name="Arguments.arguments">
                  <elementProp name="connection.url" elementType="Argument">
                    <stringProp name="Argument.name">connection.url</stringProp>
                    <stringProp name="Argument.value"></stringProp>
                    <stringProp name="Argument.metadata">=</stringProp>
                  </elementProp>
                  <elementProp name="binding.url" elementType="Argument">
                    <stringProp name="Argument.name">binding.url</stringProp>
                    <stringProp name="Argument.value"></stringProp>
                    <stringProp name="Argument.metadata">=</stringProp>
                  </elementProp>
                  <elementProp name="message" elementType="Argument">
                    <stringProp name="Argument.name">message</stringProp>
                    <stringProp name="Argument.value"></stringProp>
                    <stringProp name="Argument.metadata">=</stringProp>
                  </elementProp>
                  <elementProp name="direction" elementType="Argument">
                    <stringProp name="Argument.name">direction</stringProp>
                    <stringProp name="Argument.value"></stringProp>
                    <stringProp name="Argument.metadata">=</stringProp>
                  </elementProp>
                  <elementProp name="header.properties" elementType="Argument">
                    <stringProp name="Argument.name">header.properties</stringProp>
                    <stringProp name="Argument.value"></stringProp>
                    <stringProp name="Argument.metadata">=</stringProp>
                  </elementProp>
                  <elementProp name="header.property.reference" elementType="Argument">
                    <stringProp name="Argument.name">header.property.reference</stringProp>
                    <stringProp name="Argument.value"></stringProp>
                    <stringProp name="Argument.metadata">=</stringProp>
                  </elementProp>
                  <elementProp name="message.selector" elementType="Argument">
                    <stringProp name="Argument.name">message.selector</stringProp>
                    <stringProp name="Argument.value"></stringProp>
                    <stringProp name="Argument.metadata">=</stringProp>
                  </elementProp>
                  <elementProp name="receive.timeout" elementType="Argument">
                    <stringProp name="Argument.name">receive.timeout</stringProp>
                    <stringProp name="Argument.value"></stringProp>
                    <stringProp name="Argument.metadata">=</stringProp>
                  </elementProp>
                </collectionProp>
              </elementProp>
              <stringProp name="classname" />
            </JavaSampler>
          XML
        end
      end
    end
  end
end
