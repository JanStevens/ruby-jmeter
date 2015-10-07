module RubyJmeter
  module Nodes
    module Listeners
      class Md5hexAssertion < Nodes::Base
        allowed %i(size)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <MD5HexAssertion guiclass="MD5HexAssertionGUI" testclass="MD5HexAssertion" testname="" enabled="true">
            <stringProp name="MD5HexAssertion.size"/>
          </MD5HexAssertion>
          XML
        end
      end
    end
  end
end
