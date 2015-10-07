module RubyJmeter
  module Nodes
    module Times
      class BeanshellTimer < Nodes::Base
        defaults resetInterpreter: false
        allowed %i(filename parameters resetInterpreter script)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <BeanShellTimer guiclass="TestBeanGUI" testclass="BeanShellTimer" testname="" enabled="true">
            <stringProp name="filename" />
            <stringProp name="parameters" />
            <boolProp name="resetInterpreter" />
            <stringProp name="script"/>
          </BeanShellTimer>
          XML
        end
      end
    end
  end
end
