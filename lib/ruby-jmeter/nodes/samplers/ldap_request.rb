module RubyJmeter
  module Nodes
    module Samplers
      # @TODO Arguments.arguments
      class LdapRequest < Nodes::Base
        defaults user_defined: false, test: 'add'
        allowed %i(servername port rootdn user_defined test base_entry_dn arguments username password)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <LDAPSampler guiclass="LdapTestSamplerGui" testclass="LDAPSampler" testname="" enabled="true">
            <stringProp name="servername"/>
            <stringProp name="port"/>
            <stringProp name="rootdn"/>
            <boolProp name="user_defined">false</boolProp>
            <stringProp name="test">add</stringProp>
            <stringProp name="base_entry_dn"/>
            <elementProp name="arguments" elementType="Arguments" guiclass="ArgumentsPanel" testclass="Arguments" testname="" enabled="true">
              <collectionProp name="Arguments.arguments"/>
            </elementProp>
            <stringProp name="ConfigTestElement.username"/>
            <stringProp name="ConfigTestElement.password"/>
          </LDAPSampler>
          XML
        end
      end
    end
  end
end
