module RubyJmeter
  module Nodes
    module Listeners
      class SmimeAssertion < Nodes::Base
        defaults verify_signature: false, not_signed: false, signer_no_check: false,
          signer_check_constraints: false, signer_check_by_file: false
        allowed %i(verify_signature not_signed issuer_dn signer_dn signer_serial signer_email
          signer_cert_file signer_no_check signer_check_constraints
          signer_check_by_file message_position)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <SMIMEAssertion guiclass="SMIMEAssertionGui" testclass="SMIMEAssertion" testname="" enabled="true">
            <boolProp name="SMIMEAssert.verifySignature" />
            <boolProp name="SMIMEAssert.notSigned" />
            <stringProp name="SMIMEAssert.issuerDn" />
            <stringProp name="SMIMEAssert.signerDn" />
            <stringProp name="SMIMEAssert.signerSerial" />
            <stringProp name="SMIMEAssert.signerEmail" />
            <stringProp name="SMIMEAssert.signerCertFile" />
            <boolProp name="SMIMEAssert.signerNoCheck" />
            <boolProp name="SMIMEAssert.signerCheckConstraints" />
            <boolProp name="SMIMEAssert.signerCheckByFile" />
            <stringProp name="SMIMEAssert.messagePosition" />
          </SMIMEAssertion>
          XML
        end
      end
    end
  end
end
