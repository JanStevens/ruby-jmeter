module RubyJmeter
  module Nodes
    # @TODO Arguments.arguments collectionProp
    class TestPlan < Nodes::Base
      defaults functional_mode: false, serialize_threadgroups: false
      allowed %i(comments functional_mode serialize_threadgroups user_defined_variables user_define_classpath)
      skip_conversion!

      def node
        Nokogiri::XML(<<-XML.strip_heredoc)
        <TestPlan guiclass="TestPlanGui" testclass="TestPlan" testname="" enabled="true">
          <stringProp name="TestPlan.comments"/>
          <boolProp name="TestPlan.functional_mode" />
          <boolProp name="TestPlan.serialize_threadgroups" />
          <elementProp name="TestPlan.user_defined_variables" elementType="Arguments" guiclass="ArgumentsPanel" testclass="Arguments" testname="" enabled="true">
            #{Partials::CollectionProp.call(xml_template, params[:user_defined_variables])}
          </elementProp>
          <stringProp name="TestPlan.user_define_classpath"/>
        </TestPlan>
        XML
      end

      def exclude_in_xml
        %i(user_defined_variables)
      end

      def xml_template
        {
          collection: {
            name: 'Arguments.arguments'
          },
          element: {
            name: nil,
            elementType: 'Argument',
            attributes: [
              { key: :name, type: 'stringProp', name: 'Argument.name' },
              { key: :value, type: 'stringProp', name: 'Argument.value' },
              { key: :metadata, type: 'stringProp', name: 'Argument.metadata', value: '=' },
            ]
          }
        }
      end
    end
  end
end
