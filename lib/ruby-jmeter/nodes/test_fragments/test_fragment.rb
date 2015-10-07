module RubyJmeter
  module Nodes
    module TestFragments
      class TestFragment < Nodes::Base
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <TestFragmentController guiclass="TestFragmentControllerGui" testclass="TestFragmentController" testname="" enabled="false"/>)
          XML
        end
      end
    end
  end
end
