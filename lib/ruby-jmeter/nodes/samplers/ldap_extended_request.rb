module RubyJmeter
  module Nodes
    module Samplers
      class LdapExtendedRequest < Nodes::Base
        allowed %i(servername port rootdn scope countlimit timelimit attributes return_object
          deref_aliases connection_timeout parseflag secure user_dn user_pw comparedn comparefilt
          modddn newdn)
        defaults scope: 2, return_object: false, deref_aliases: false

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <LDAPExtSampler guiclass="LdapExtTestSamplerGui" testclass="LDAPExtSampler" testname="" enabled="true">
            <stringProp name="servername"/>
            <stringProp name="port"/>
            <stringProp name="rootdn"/>
            <stringProp name="scope" />
            <stringProp name="countlimit"/>
            <stringProp name="timelimit"/>
            <stringProp name="attributes"/>
            <stringProp name="return_object" />
            <stringProp name="deref_aliases" />
            <stringProp name="connection_timeout"/>
            <stringProp name="parseflag" />
            <stringProp name="secure" />
            <stringProp name="user_dn" />
            <stringProp name="user_pw" />
            <stringProp name="comparedn" />
            <stringProp name="comparefilt" />
            <stringProp name="modddn" />
            <stringProp name="newdn" />
          </LDAPExtSampler>
          XML
        end
      end
    end
  end
end
