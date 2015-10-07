module RubyJmeter
  module Nodes
    module Times
      class UniformRandomTimer < Nodes::Base
        defaults delay: 0, range: 100.0
        allowed %i(delay range)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <UniformRandomTimer guiclass="UniformRandomTimerGui" testclass="UniformRandomTimer" testname="" enabled="true">
            <stringProp name="ConstantTimer.delay">0</stringProp>
            <stringProp name="RandomTimer.range">100.0</stringProp>
          </UniformRandomTimer>
          XML
        end
      end
    end
  end
end
