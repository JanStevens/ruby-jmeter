module RubyJmeter
  module Nodes
    module Listeners
      class ViewResultsTree < Nodes::Base
        defaults error_logging: false
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            root_node(xml) do
              bool(xml, attributes[:error_logging], name: 'ResultCollector.error_logging')
              obj_prop(xml, attributes[:config])
              string(xml, attributes[:file], name: 'filename')
            end
          end.doc
        end

        def root_node(xml, &block)
          xml.ResultCollector(guiclass: 'ViewResultsFullVisualizer',
            testclass: 'ResultCollector',
            testname: attributes[:test_name],
            enabled: attributes[:enabled],
            &block)
        end
      end
    end
  end
end

