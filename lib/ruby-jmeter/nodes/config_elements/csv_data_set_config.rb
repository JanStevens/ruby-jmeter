module RubyJmeter
  module Nodes
    module ConfigElements
      class CsvDataSetConfig < Nodes::Base
        defaults delimiter: ',', quoted_data: false, recycle: true, share_mode: 'shareMode.all',
          stop_thread: false
        allowed %i(delimiter file_encoding filename quoted_data recycle share_mode
          stop_thread variable_names)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <CSVDataSet guiclass="TestBeanGUI" testclass="CSVDataSet" testname="" enabled="true">
              <stringProp name="delimiter" />
              <stringProp name="fileEncoding"/>
              <stringProp name="filename" />
              <boolProp name="quotedData" />
              <boolProp name="recycle" />
              <stringProp name="shareMode" />
              <boolProp name="stopThread" />
              <stringProp name="variableNames"/>
            </CSVDataSet>
          XML
        end
      end
    end
  end
end
