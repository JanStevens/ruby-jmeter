module RubyJmeter
  module Nodes
    module Samplers
      class AccessLogSampler < Nodes::Base
        defaults imageParsing: false, parserClassName: 'org.apache.jmeter.protocol.http.util.accesslog.TCLogParser'
        allowed %i(domain imageParsing logFile parserClassName portString)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <AccessLogSampler guiclass="TestBeanGUI" testclass="AccessLogSampler" testname="#{name}" enabled="true">
              <elementProp name="HTTPsampler.Arguments" elementType="Arguments">
                <collectionProp name="Arguments.arguments"/>
              </elementProp>
              <stringProp name="domain"/>
              <boolProp name="imageParsing" />
              <stringProp name="logFile"/>
              <stringProp name="parserClassName"></stringProp>
              <stringProp name="portString"/>
            </AccessLogSampler>
          XML
        end
      end
    end
  end
end
