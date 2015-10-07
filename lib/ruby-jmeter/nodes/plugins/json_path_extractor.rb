module RubyJmeter
  module Nodes
    module Plugins
      class JsonPathExtractor < Nodes::Base
        allowed %i(VAR JSONPATH)
        skip_conversion!

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <com.atlantbh.jmeter.plugins.jsonutils.jsonpathextractor.JSONPathExtractor guiclass="com.atlantbh.jmeter.plugins.jsonutils.jsonpathextractor.gui.JSONPathExtractorGui" testclass="com.atlantbh.jmeter.plugins.jsonutils.jsonpathextractor.JSONPathExtractor" testname="" enabled="true">
            <stringProp name="VAR"></stringProp>
            <stringProp name="JSONPATH"></stringProp>
          </com.atlantbh.jmeter.plugins.jsonutils.jsonpathextractor.JSONPathExtractor>
          XML
        end
      end
    end
  end
end

