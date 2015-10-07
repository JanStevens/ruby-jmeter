module RubyJmeter
  module Nodes
    module ConfigElements
      class LdapRequestDefaults < Nodes::Base
        defaults user_defined: true, test: 'add', metadata: '='
        allowed %i(servername port rootdn user_defined test base_entry_dn)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <ConfigTestElement guiclass="LdapConfigGui" testclass="ConfigTestElement" testname="" enabled="true">
            <stringProp name="servername"/>
            <stringProp name="port"/>
            <stringProp name="rootdn"/>
            <boolProp name="user_defined" />
            <stringProp name="test" />
            <stringProp name="base_entry_dn"/>
            <elementProp name="arguments" elementType="Arguments" guiclass="ArgumentsPanel" testclass="Arguments" testname="" enabled="true">
              <collectionProp name="Arguments.arguments">
                <elementProp name=" " elementType="Argument">
                  <stringProp name="Argument.name" />
                  <stringProp name="Argument.value" />
                  <stringProp name="Argument.metadata" />
                </elementProp>
              </collectionProp>
            </elementProp>
          </ConfigTestElement>
          XML
        end
      end
    end
  end
end
