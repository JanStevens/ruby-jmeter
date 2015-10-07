module RubyJmeter
  module Nodes
    module ConfigElements
      class SimpleConfigElement < Nodes::Base
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <ConfigTestElement guiclass="SimpleConfigGui" testclass="ConfigTestElement" testname="" enabled="true"/>)
          XML
        end
      end
    end
  end
end
