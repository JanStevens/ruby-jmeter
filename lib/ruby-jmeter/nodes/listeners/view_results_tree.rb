module RubyJmeter
  module Nodes
    module Listeners
      class ViewResultsTree < Nodes::Base
        defaults error_logging: false
        allowed %i(error_logging filename config)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <ResultCollector guiclass="ViewResultsFullVisualizer" testclass="ResultCollector" testname="" enabled="true">
            <boolProp name="ResultCollector.error_logging" />
            #{RubyJmeter::Nodes::Partials::ObjProp.call(params[:config]) }
            <stringProp name="filename"/>
          </ResultCollector>
          XML
        end
      end
    end
  end
end

