module RubyJmeter
  module Nodes
    module Listeners
      class SaveResponsesToAFile < Nodes::Base
        defaults errorsonly: false, skip_auto_number: false, skip_suffix: false, success_only: false
        allowed %i(errorsonly skip_auto_number skip_suffix success_only)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <ResultSaver guiclass="ResultSaverGui" testclass="ResultSaver" testname="" enabled="true">
            <stringProp name="FileSaver.filename"/>
            <boolProp name="FileSaver.errorsonly" />
            <boolProp name="FileSaver.skipautonumber" />
            <boolProp name="FileSaver.skipsuffix" />
            <boolProp name="FileSaver.successonly" />
          </ResultSaver>
          XML
        end
      end
    end
  end
end
