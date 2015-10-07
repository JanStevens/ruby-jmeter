module RubyJmeter
  module Nodes
    module ConfigElements
      class HttpAuthorizationManager < Nodes::Base
        allowed %i(url username password domain realm)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <AuthManager guiclass="AuthPanel" testclass="AuthManager" testname="" enabled="true">
            <collectionProp name="AuthManager.auth_list">
              <elementProp name="" elementType="Authorization">
                <stringProp name="Authorization.url"/>
                <stringProp name="Authorization.username"/>
                <stringProp name="Authorization.password"/>
                <stringProp name="Authorization.domain"/>
                <stringProp name="Authorization.realm"/>
              </elementProp>
            </collectionProp>
          </AuthManager>
          XML
        end
      end
    end
  end
end
