module RubyJmeter
  module Nodes
    module ConfigElements
      class HttpCookieManager < Nodes::Base
        defaults clear_each_iteration: false, policy: 'default',
          implementation: 'org.apache.jmeter.protocol.http.control.HC4CookieHandler'
        allowed %i(cookies clear_each_iteration policy implementation)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <CookieManager guiclass="CookiePanel" testclass="CookieManager" testname="" enabled="true">
            <collectionProp name="CookieManager.cookies">
              <elementProp name="test" elementType="Cookie" testname="test">
                <stringProp name="Cookie.value">test</stringProp>
                <stringProp name="Cookie.domain">getin.dev</stringProp>
                <stringProp name="Cookie.path"></stringProp>
                <boolProp name="Cookie.secure">false</boolProp>
                <longProp name="Cookie.expires">0</longProp>
                <boolProp name="Cookie.path_specified">true</boolProp>
                <boolProp name="Cookie.domain_specified">true</boolProp>
              </elementProp>
            </collectionProp>
            <boolProp name="CookieManager.clearEachIteration" />
            <stringProp name="CookieManager.policy" />
            <stringProp name="CookieManager.implementation" />
          </CookieManager>
          XML
        end
      end
    end
  end
end
