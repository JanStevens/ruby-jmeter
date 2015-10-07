module RubyJmeter
  module Nodes
    module ConfigElements
      class LdapExtendedRequestDefaults < Nodes::Base
        defaults scope: 2, return_object: false, deref_aliases: false,
          parseflag: false, secure: false

        allowed %i(servername port rootdn scope count_limit time_limit attributes return_object deref_aliases
          connection_timeout parseflag secure user_dn user_pw comparedn comparefilt modddn newdn)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <ConfigTestElement guiclass="LdapExtConfigGui" testclass="ConfigTestElement" testname="" enabled="true">
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
            <stringProp name="user_dn"/>
            <stringProp name="user_pw"/>
            <stringProp name="comparedn"/>
            <stringProp name="comparefilt"/>
            <stringProp name="modddn"/>
            <stringProp name="newdn"/>
          </ConfigTestElement>
          XML
        end
      end
    end
  end
end
