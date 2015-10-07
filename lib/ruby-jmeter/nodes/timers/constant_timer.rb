module RubyJmeter
  module Nodes
    module Times
      class ConstantTimer < Nodes::Base
        defaults delay: 300
        allowed %i(delay)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <ConstantTimer guiclass="ConstantTimerGui" testclass="ConstantTimer" testname="" enabled="true">
            <stringProp name="ConstantTimer.delay" />
          </ConstantTimer>
          XML
        end
      end
    end
  end
end
