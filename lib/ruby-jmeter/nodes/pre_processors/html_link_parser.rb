module RubyJmeter
  module Nodes
    module PreProcessors
      class HtmlLinkParser < Nodes::Base
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <AnchorModifier guiclass="AnchorModifierGui" testclass="AnchorModifier" testname="" enabled="true"/>)
          XML
        end
      end
    end
  end
end
