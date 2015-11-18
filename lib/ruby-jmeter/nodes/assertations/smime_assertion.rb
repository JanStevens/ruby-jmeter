module RubyJmeter
  module Nodes
    module Listeners
      class SmimeAssertion < Nodes::Base
        uses_new_syntax!
        defaults verify_signature: false, not_signed: false, signer_no_check: false,
          signer_check_constraints: false, signer_check_by_file: false

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.SMIMEAssertion guiclass: "SMIMEAssertionGui", testclass: "SMIMEAssertion",
              testname: attributes[:test_name], enabled: attributes[:enabled] do
              bool(xml, attributes[:verify_signature], name: 'SMIMEAssert.verifySignature')
              bool(xml, attributes[:not_signed], name: "SMIMEAssert.notSigned")
              string(xml, attributes[:issuer_dn], name: "SMIMEAssert.issuerDn")
              string(xml, attributes[:signer_dn], name: "SMIMEAssert.signerDn")
              string(xml, attributes[:signer_serial], name: "SMIMEAssert.signerSerial")
              string(xml, attributes[:signer_email], name: "SMIMEAssert.signerEmail")
              string(xml, attributes[:signer_cert_file], name: "SMIMEAssert.signerCertFile")
              bool(xml, attributes[:signer_no_check], name: "SMIMEAssert.signerNoCheck")
              bool(xml, attributes[:signer_check_constraints], name: "SMIMEAssert.signerCheckConstraints")
              bool(xml, attributes[:signer_check_by_file], name: "SMIMEAssert.signerCheckByFile")
              string(xml, attributes[:message_position], name: "SMIMEAssert.messagePosition")
            end
          end.doc
        end
      end
    end
  end
end
