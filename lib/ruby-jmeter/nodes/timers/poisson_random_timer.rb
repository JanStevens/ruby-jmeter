module RubyJmeter
  module Nodes
    module Times
      class PoissonRandomTimer < Nodes::Base
        defaults delay: 300, range: 100
        allowed %i(delay range)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <PoissonRandomTimer guiclass="PoissonRandomTimerGui" testclass="PoissonRandomTimer" testname="" enabled="true">
            <stringProp name="ConstantTimer.delay" />
            <stringProp name="RandomTimer.range" />
          </PoissonRandomTimer>
          XML
        end
      end
    end
  end
end
