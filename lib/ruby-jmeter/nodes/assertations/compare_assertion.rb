module RubyJmeter
  module Nodes
    module Assertations
      class CompareAssertion < Nodes::Base
        defaults compare_time: -1, compare_content: true
        allowed %i(compare_content compare_time strings_to_skip)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <CompareAssertion guiclass="TestBeanGUI" testclass="CompareAssertion" testname="" enabled="true">
            <boolProp name="compareContent" />
            <longProp name="compareTime" />
            <collectionProp name="stringsToSkip"/>
          </CompareAssertion>
          XML
        end
      end
    end
  end
end
