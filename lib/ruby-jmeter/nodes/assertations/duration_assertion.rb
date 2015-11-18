module RubyJmeter
  module Nodes
    module Assertations
      class DurationAssertion < Nodes::Base
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.DurationAssertion guiclass: 'DurationAssertionGui', testclass: 'DurationAssertion',
              testname: attributes[:test_name], enabled: attributes[:enabled] do
              string(xml, attributes[:duration], name: 'DurationAssertion.duration')
              string(xml, attributes[:scope], name: 'Assertion.scope')
            end
          end.doc
        end
      end
    end
  end
end
