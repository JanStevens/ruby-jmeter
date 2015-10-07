module RubyJmeter
  module Nodes
    module Samplers
      class MailReaderSampler < Nodes::Base
        allowed %i(host_type folder host username password num_messages delete useSSL useStartTLS
          trustAllCerts enforceStartTLS useLocalTrustStore trustStoreToUse)
        defaults host_type: 'pop3', folder: 'INBOX', num_messages: -1, delete: false,
          useSSL: false, useStartTLS: false, trustAllCerts: false, enforceStartTLS: false,
          useLocalTrustStore: false

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <MailReaderSampler guiclass="MailReaderSamplerGui" testclass="MailReaderSampler" testname="" enabled="true">
              <stringProp name="host_type" />
              <stringProp name="folder" />
              <stringProp name="host" />
              <stringProp name="username" />
              <stringProp name="password" />
              <intProp name="num_messages" />
              <boolProp name="delete" />
              <stringProp name="SMTPSampler.useSSL" />
              <stringProp name="SMTPSampler.useStartTLS" />
              <stringProp name="SMTPSampler.trustAllCerts" />
              <stringProp name="SMTPSampler.enforceStartTLS" />
              <stringProp name="SMTPSampler.useLocalTrustStore" />
              <stringProp name="SMTPSampler.trustStoreToUse"/>
            </MailReaderSampler>
          XML
        end
      end
    end
  end
end
