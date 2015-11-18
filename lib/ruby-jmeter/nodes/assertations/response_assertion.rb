module RubyJmeter
  module Nodes
    module Listeners
      class ResponseAssertion < Nodes::Base
        defaults test_field: 'Assertion.response_data_as_document', assume_success: false, scope: 'all'
        uses_new_syntax!

        def node
          test_type = convert_test_type(params.keys.first)
          test_strings = Array(params.values.first)

          Nokogiri::XML::Builder.new do |xml|
            xml.ResponseAssertion(guiclass: 'AssertionGui', testclass: 'ResponseAssertion', testname: params[:name], enabled: true) do
              collection xml, name: 'Asserion.test_strings' do
                test_strings.each_with_index do |test_string, idx|
                  string xml, test_string, name: "test_string_#{idx}"
                end
              end
              string xml, params[:test_field], name: 'Assertion.test_field'
              bool xml, params[:assume_success], name: 'Assertion.assume_success'
              int xml, test_type, name: 'Assertion.test_type'
              if params[:variable]
                string xml, 'variable', name: 'Assertion.scope'
                string xml, params[:variable], name: 'Scope.variable'
              elsif params[:scope] != 'main'
                string xml, params[:scope], name: 'Assertion.scope'
              end
            end
          end.doc
        end

        def convert_test_type(type)
          case type.to_s
            when 'contains'
              2
            when 'not-contains'
              6
            when 'matches'
              1
            when 'not-matches'
              5
            when 'equals'
              8
            when 'not-equals'
              12
            when 'substring'
              16
            when 'not-substring'
              20
            else
              2
          end
        end
      end
    end
  end
end
