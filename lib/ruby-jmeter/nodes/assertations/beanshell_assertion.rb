module RubyJmeter
  module Nodes
    module Assertations
      class BeanshellAssertion < Nodes::Base
        defaults reset_interpreter: false
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.BeanShellAssertion guiclass: 'BeanShellAssertionGui', testclass: 'BeanShellAssertion', testname: attributes[:test_name], enabled: attributes[:enabled] do
              string(xml, attributes[:query], name: 'BeanShellAssertion.query')
              string(xml, attributes[:filename], name: 'BeanShellAssertion.filename')
              string(xml, attributes[:parameters], name: 'BeanShellAssertion.parameters')
              string(xml, attributes[:reset_interpreter], name: 'BeanShellAssertion.resetInterpreter')
            end
          end.doc
        end
      end
    end
  end
end
