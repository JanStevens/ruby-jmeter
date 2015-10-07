module RubyJmeter
  module Nodes
    module Times
      class GaussianRandomTimer < Nodes::Base
        defaults delay: 300, range: 100.0
        allowed %i(delay range)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <GaussianRandomTimer guiclass="GaussianRandomTimerGui" testclass="GaussianRandomTimer" testname="" enabled="true">
            <stringProp name="ConstantTimer.delay" />
            <stringProp name="RandomTimer.range" />
          </GaussianRandomTimer>
          XML
        end
      end
    end
  end
end
