module RubyJmeter
  module Nodes
    module Samplers
      class SmtpSampler < Nodes::Base
        defaults suppressSubject: false, include_timestamp: false, plainBody: false, useSSL: false,
          useStartTLS: false, trustAllCerts: false, enforceStartTLS: false, use_eml: false,
          useAuth: false, messageSizeStatistics: false, enableDebug: false

        allowed %i(server serverPort mailFrom replyTo receiverTo receiverCC receiverBCC subject
          suppressSubject include_timestamp message plainBody attachFile useSSL useStartTLS trustAllCerts enforceStartTLS
          useLocalTrustStore trustStoreToUse use_eml emlMessageToSend useAuth password username messageSizeStatistics
          enableDebug headerFields)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <SmtpSampler guiclass="SmtpSamplerGui" testclass="SmtpSampler" testname="" enabled="true">
              <stringProp name="SMTPSampler.server"/>
              <stringProp name="SMTPSampler.serverPort"/>
              <stringProp name="SMTPSampler.mailFrom"/>
              <stringProp name="SMTPSampler.replyTo"/>
              <stringProp name="SMTPSampler.receiverTo"/>
              <stringProp name="SMTPSampler.receiverCC"/>
              <stringProp name="SMTPSampler.receiverBCC"/>
              <stringProp name="SMTPSampler.subject"/>
              <stringProp name="SMTPSampler.suppressSubject" />
              <stringProp name="SMTPSampler.include_timestamp"/>
              <stringProp name="SMTPSampler.message"/>
              <stringProp name="SMTPSampler.plainBody"/>
              <stringProp name="SMTPSampler.attachFile"/>
              <stringProp name="SMTPSampler.useSSL"/>
              <stringProp name="SMTPSampler.useStartTLS"/>
              <stringProp name="SMTPSampler.trustAllCerts"/>
              <stringProp name="SMTPSampler.enforceStartTLS"/>
              <stringProp name="SMTPSampler.useLocalTrustStore"/>
              <stringProp name="SMTPSampler.trustStoreToUse"/>
              <boolProp name="SMTPSampler.use_eml"/>
              <stringProp name="SMTPSampler.emlMessageToSend"/>
              <stringProp name="SMTPSampler.useAuth"/>
              <stringProp name="SMTPSampler.password"/>
              <stringProp name="SMTPSampler.username"/>
              <stringProp name="SMTPSampler.messageSizeStatistics"/>
              <stringProp name="SMTPSampler.enableDebug"/>
              <collectionProp name="SMTPSampler.headerFields"/>
            </SmtpSampler>
          XML
        end
      end
    end
  end
end
