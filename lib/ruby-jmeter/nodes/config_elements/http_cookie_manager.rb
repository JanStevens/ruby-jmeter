module RubyJmeter
  module Nodes
    module ConfigElements
      class HttpCookieManager < Nodes::Base
        defaults clear_each_iteration: false, policy: 'default',
          implementation: 'org.apache.jmeter.protocol.http.control.HC4CookieHandler'

        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            root_node(xml) do
              cookies(xml) do
                Array(attributes[:cookies]).each do |cookie|
                  element(xml, cookie[:name], elementType: 'Cookie', testname: cookie[:name]) do
                    string(xml, cookie[:value], name: 'Cookie.value')
                    string(xml, cookie[:domain], name: 'Cookie.domain')
                    string(xml, cookie[:path], name: 'Cookie.path')
                    bool(xml, cookie[:secure], name: 'Cookie.secure')
                    long(xml, cookie[:expires] || 0, name: 'Cookie.expires')
                    bool(xml, cookie[:path].present?, name: 'Cookie.path_specified')
                    bool(xml, cookie[:domain].present?, name: 'Cookie.domain_specified')
                  end
                end
              end
              bool(xml, attributes[:clear_each_iteration], name: 'CookieManager.clearEachIteration')
              string(xml, attributes[:policy], name: 'CookieManager.policy')
              string(xml, attributes[:implementation], name: 'CookieManager.implementation')
            end
          end.doc
        end

        def root_node(xml, &block)
          xml.CookieManager(guiclass: "CookiePanel",
            testclass: "CookieManager",
            testname: attributes[:test_name],
            enabled: attributes[:enabled], &block)
        end

        def cookies(xml, &block)
          collection(xml, name: 'CookieManager.cookies', &block)
        end
      end
    end
  end
end
