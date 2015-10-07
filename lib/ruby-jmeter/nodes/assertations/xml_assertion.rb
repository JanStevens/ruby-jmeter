module RubyJmeter
  module Nodes
    module Listeners
      class XmlAssertion < Nodes::Base
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <XMLAssertion guiclass="XMLAssertionGui" testclass="XMLAssertion" testname="" enabled="true"/>)
          XML
        end
      end
    end
  end
end
