module RubyJmeter
  module Nodes
    module ConfigElements
      class Counter < Nodes::Base
        defaults per_user: true, reset_on_iteration: false, step: 1, start: 0

        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            root_node(xml) do
              string(xml, attributes[:start], name: 'CounterConfig.start')
              string(xml, attributes[:end], name: 'CounterConfig.end')
              string(xml, attributes[:step], name: 'CounterConfig.incr')
              string(xml, attributes[:reference], name: 'CounterConfig.name')
              string(xml, attributes[:format], name: 'CounterConfig.format')
              bool(xml, attributes[:per_user], name: 'CounterConfig.per_user')
              bool(xml, attributes[:reset_on_iteration], name: 'CounterConfig.reset_on_tg_iteration')
            end
          end.doc
        end

        def root_node(xml, &block)
          xml.CounterConfig guiclass: 'CounterConfigGui',
            testclass: 'CounterConfig',
            testname: attributes[:test_name],
            enabled: attributes[:enabled],
            &block
        end
      end
    end
  end
end
