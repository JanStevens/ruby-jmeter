module RubyJmeter
  module Nodes
    module ConfigElements
      class UserDefinedVariables < Nodes::Base
        defaults metadata: '='
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <Arguments guiclass="ArgumentsPanel" testclass="Arguments" testname="" enabled="true">
            <collectionProp name="Arguments.arguments">
              <elementProp name=" " elementType="Argument">
                <stringProp name="Argument.name" />
                <stringProp name="Argument.value" />
                <stringProp name="Argument.metadata" />
                <stringProp name="Argument.desc" />
              </elementProp>
            </collectionProp>
            <stringProp name="TestPlan.comments" />
          </Arguments>
          XML

        end
      end
    end
  end
end
