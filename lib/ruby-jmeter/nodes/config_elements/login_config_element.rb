module RubyJmeter
  module Nodes
    module ConfigElements
      class LoginConfigElement < Nodes::Base
        allowed %i(username password)
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <ConfigTestElement guiclass="LoginConfigGui" testclass="ConfigTestElement" testname="" enabled="true">
              <stringProp name="ConfigTestElement.username" />
              <stringProp name="ConfigTestElement.password" />
            </ConfigTestElement>
          XML
        end
      end
    end
  end
end
