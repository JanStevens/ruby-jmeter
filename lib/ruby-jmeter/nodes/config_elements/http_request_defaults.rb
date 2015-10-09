module RubyJmeter
  module Nodes
    module ConfigElements
      # arguments: [ { name: 'Name', value: 'Value', encode: true, equals: false }]
      class HttpRequestDefaults < Nodes::Base
        defaults path: '/', implementation: 'HttpClient4', image_parser: true, use_concurrent_pool: true,
          concurrent_pool: 4, protocol: 'http'

        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            root_node(xml) do
              arguments(xml) do
                collection(xml, name: 'Arguments.arguments') do
                  Array(attributes[:arguments]).each do |argument|
                    element(xml, name: argument[:name], elementType: 'HTTPArgument') do
                      bool(xml, argument[:encode], name: 'HTTPArgument.always_encode')
                      string(xml, argument[:value], name: 'Argument.value')
                      string(xml, argument[:metadata] || '=', name: 'Argument.metadata')
                      bool(xml, argument[:equals], name: 'HTTPArgument.use_equals')
                      string(xml, argument[:name], name: 'Argument.name')
                    end
                  end
                end
              end
              string(xml, attributes[:domain], name: 'HTTPSampler.domain')
              string(xml, attributes[:port], name: 'HTTPSampler.port')
              string(xml, attributes[:connect_timeout], name: 'HTTPSampler.connect_timeout')
              string(xml, attributes[:response_timeout], name: 'HTTPSampler.response_timeout')
              string(xml, attributes[:protocol], name: 'HTTPSampler.protocol')
              string(xml, attributes[:encoding], name: 'HTTPSampler.contentEncoding')
              string(xml, attributes[:path], name: 'HTTPSampler.path')
              string(xml, attributes[:implementation], name: 'HTTPSampler.implementation')
              bool(xml, attributes[:image_parser], name: 'HTTPSampler.image_parser')
              bool(xml, attributes[:use_concurrent_pool], name: 'HTTPSampler.concurrentDwn')
              string(xml, attributes[:concurrent_pool], name: 'HTTPSampler.concurrentPool')
              string(xml, attributes[:embedded_url_re], name: 'HTTPSampler.embedded_url_re')
            end
          end.doc
        end

        def root_node(xml, &block)
          xml.ConfigTestElement(guiclass: 'HttpDefaultsGui', testclass: 'ConfigTestElement',
            testname: attributes[:test_name], enabled: attributes[:enabled], &block)
        end

        def arguments(xml, &block)
          element(xml, name: "HTTPsampler.Arguments",
            elementType: "Arguments",
            guiclass: "HTTPArgumentsPanel",
            testclass: "Arguments",
            testname: attributes[:test_name],
            enabled: "true", &block)
        end
      end
    end
  end
end
