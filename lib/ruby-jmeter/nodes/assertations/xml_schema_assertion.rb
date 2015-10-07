module RubyJmeter
  module Nodes
    module Listeners
      class XmlSchemaAssertion < Nodes::Base
        allowed %i(xmlschema_assertation_filename)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
        <XMLSchemaAssertion guiclass="XMLSchemaAssertionGUI" testclass="XMLSchemaAssertion" testname="" enabled="true">
          <stringProp name="xmlschema_assertion_filename"/>
        </XMLSchemaAssertion>
          XML
        end
      end
    end
  end
end
