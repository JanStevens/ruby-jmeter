module RubyJmeter
  module Nodes
    module Plugins
      class JsonPathExtractor < Nodes::Base
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            root_node(xml) do
              string(xml, attributes[:reference], name: 'VAR')
              string(xml, attributes[:json], name: 'JSONPATH')
              string(xml, attributes[:default], name: 'DEFAULT')
              string(xml, attributes[:variable], name: 'VARIABLE')
              string(xml, subject, name: 'SUBJECT')
            end
          end.doc
        end

        def root_node(xml, &block)
          xml.send('com.atlantbh.jmeter.plugins.jsonutils.jsonpathextractor.JSONPathExtractor',
            guiclass: 'com.atlantbh.jmeter.plugins.jsonutils.jsonpathextractor.gui.JSONPathExtractorGui',
            testclass: "com.atlantbh.jmeter.plugins.jsonutils.jsonpathextractor.JSONPathExtractor",
            testname: attributes[:test_name],
            enabled: attributes[:enabled],
            &block)
        end

        def subject
          attributes[:variable].present? ? 'VAR' : 'BODY'
        end
      end
    end
  end
end

