module RubyJmeter
  module Nodes
    module Samplers
      class BeanshellSampler < Nodes::Base
        defaults resetInterpreter: false
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <BeanShellSampler guiclass="BeanShellSamplerGui" testclass="BeanShellSampler" testname="" enabled="true">
            <stringProp name="BeanShellSampler.query"/>
            <stringProp name="BeanShellSampler.filename"/>
            <stringProp name="BeanShellSampler.parameters"/>
            <boolProp name="BeanShellSampler.resetInterpreter" />
          </BeanShellSampler>
          XML
        end
      end
    end
  end
end
