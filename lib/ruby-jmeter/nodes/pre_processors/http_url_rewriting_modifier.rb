module RubyJmeter
  module Nodes
    module PreProcessors
      class HttpUrlRewritingModifier < Nodes::Base
        defaults path_extension: false, path_extension_no_equals: false, path_extension_no_questionmark: false,
          cache_value: false, encode: false

        allowed %i(argument_name path_extension path_extension_no_equals path_extension_no_questionmark
          encode cache_value)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <URLRewritingModifier guiclass="URLRewritingModifierGui" testclass="URLRewritingModifier" testname="" enabled="true">
            <stringProp name="argument_name"/>
            <boolProp name="path_extension" />
            <boolProp name="path_extension_no_equals" />
            <boolProp name="path_extension_no_questionmark" />
            <boolProp name="cache_value" />
            <boolProp name="encode" />
          </URLRewritingModifier>
          XML
        end
      end
    end
  end
end
