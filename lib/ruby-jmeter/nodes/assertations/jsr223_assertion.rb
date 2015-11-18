module RubyJmeter
  module Nodes
    module Listeners
      class Jsr223Assertion < Nodes::Base
        uses_new_syntax!
        allowed %i(script_language parameters filename cache_key script)

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.JSR223Assertion guiclass: "TestBeanGUI", testclass: "JSR223Assertion",
              testname: attributes[:test_name], enabled: attributes[:enabled] do
              string(xml, attributes[:script_language], name: 'scriptLanguage')
              string(xml, attributes[:parameters], name: 'parameters')
              string(xml, attributes[:filename], name: 'filename')
              string(xml, attributes[:cache_key], name: 'cache_key')
              string(xml, attributes[:script], name: 'script')
            end
          end.doc
        end
      end
    end
  end
end
