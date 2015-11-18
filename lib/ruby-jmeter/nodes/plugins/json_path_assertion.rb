module RubyJmeter
  module Nodes
    module Plugins
      class JsonPathAssertion < Nodes::Base
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            root_node(xml) do
              string(xml, attributes[:json], name: 'JSON_PATH')
              string(xml, attributes[:value], name: 'EXPECTED_VALUE')
              bool(xml, attributes[:value].present?, name: 'JSONVALIDATION')
              bool(xml, attributes[:null], name: 'EXPECT_NULL')
            end
          end.doc
        end

        def root_node(xml, &block)
          xml.send('com.atlantbh.jmeter.plugins.jsonutils.jsonpathassertion.JSONPathAssertion',
            guiclass: 'com.atlantbh.jmeter.plugins.jsonutils.jsonpathassertion.gui.JSONPathAssertionGui',
            testclass: 'com.atlantbh.jmeter.plugins.jsonutils.jsonpathassertion.JSONPathAssertion',
            testname: attributes[:test_name],
            enabled: attributes[:enabled],
            &block)
        end
      end
    end
  end
end
