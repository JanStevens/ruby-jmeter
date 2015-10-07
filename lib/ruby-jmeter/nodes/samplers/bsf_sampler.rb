module RubyJmeter
  module Nodes
    module Samplers
      class BsfSampler < Nodes::Base
        allowed %i(filename parameters script scriptLanguage)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <BSFSampler guiclass="TestBeanGUI" testclass="BSFSampler" testname="" enabled="true">
            <stringProp name="filename"/>
            <stringProp name="parameters"/>
            <stringProp name="script"/>
            <stringProp name="scriptLanguage"/>
          </BSFSampler>
          XML
        end
      end
    end
  end
end
