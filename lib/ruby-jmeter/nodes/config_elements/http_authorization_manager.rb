module RubyJmeter
  module Nodes
    module ConfigElements
      class HttpAuthorizationManager < Nodes::Base
        defaults clear_each_iteration: false
        uses_new_syntax!

        def node
          authorization = Array(attributes[:authorization])
          Nokogiri::XML::Builder.new do |xml|
            xml.AuthManager guiclass: "AuthPanel", testclass: "AuthManager",
              testname: attributes[:test_name], enabled: attributes[:enabled] do
              collection(xml, name: 'AuthManager.auth_list') do
                authorization.each do |auth|
                  element(xml, name: '', elementType: 'Authorization') do
                    string(xml, auth[:url], name: 'Authorization.url')
                    string(xml, auth[:username], name: 'Authorization.username')
                    string(xml, auth[:password], name: 'Authorization.password')
                    string(xml, auth[:domain], name: 'Authorization.domain')
                    string(xml, auth[:realm], name: 'Authorization.realm')
                    if auth[:mechanism]
                      string(xml, auth[:mechanism], name: 'Authorization.mechanism')
                    end
                  end
                end
              end
              bool(xml, attributes[:clear_each_iteration], name: 'AuthManager.clearEachIteration')
            end
          end.doc
        end
      end
    end
  end
end
