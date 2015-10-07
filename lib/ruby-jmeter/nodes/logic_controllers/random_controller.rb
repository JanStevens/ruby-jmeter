module RubyJmeter
  module Nodes
    module LogicControllers
      class RandomController < Nodes::Base
        defaults style: 1
        allowed :style

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <RandomController guiclass="RandomControlGui" testclass="RandomController" testname="" enabled="true">
            <intProp name="InterleaveControl.style" />
          </RandomController>
          XML
        end
      end
    end
  end
end
