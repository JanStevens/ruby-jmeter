module RubyJmeter
  module Nodes
    module Assertations
      class DurationAssertion < Nodes::Base
        allowed %i(duration)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <DurationAssertion guiclass="DurationAssertionGui" testclass="DurationAssertion" testname="" enabled="true">
            <stringProp name="DurationAssertion.duration"/>
          </DurationAssertion>
          XML
        end
      end
    end
  end
end
