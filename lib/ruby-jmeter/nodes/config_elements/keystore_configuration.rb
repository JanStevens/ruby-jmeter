module RubyJmeter
  module Nodes
    module ConfigElements
      class KeystoreConfiguration < Nodes::Base
        defaults preload: true
        allowed %i(end_index preload start_index client_cert_alias_var_name)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <KeystoreConfig guiclass="TestBeanGUI" testclass="KeystoreConfig" testname="" enabled="true">
            <stringProp name="endIndex"/>
            <stringProp name="preload" />
            <stringProp name="startIndex"/>
            <stringProp name="clientCertAliasVarName"/>
          </KeystoreConfig>
          XML
        end
      end
    end
  end
end
