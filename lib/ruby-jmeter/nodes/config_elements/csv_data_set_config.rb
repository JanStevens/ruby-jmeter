module RubyJmeter
  module Nodes
    module ConfigElements
      class CsvDataSetConfig < Nodes::Base
        defaults delimiter: ',', quoted_data: false, recycle: true, share_mode: :all, stop_thread: false
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.CSVDataSet(guiclass: 'TestBeanGUI', testclass: 'CSVDataSet', testname: attributes[:test_name], enabled: attributes[:enabled]) do
              string(xml, attributes[:delimiter], name: 'delimiter')
              string(xml, attributes[:file_encoding], name: 'fileEncoding')
              string(xml, attributes[:file], name: 'filename')
              bool(xml, attributes[:quoted_data], name: 'quotedData')
              bool(xml, attributes[:recycle], name: 'recycle')
              string(xml, convert_share_mode, name: 'shareMode')
              bool(xml, attributes[:stop_thread], name: 'stopThread')
              string(xml, attributes[:variable_names], name: 'variableNames')
            end
          end.doc
        end

        def convert_share_mode
          case attributes[:share_mode]
            when :all then
              'shareMode.all'
            when :thread then
              'shareMode.thread'
            when :group then
              'shareMode.group'
            else
              params[:share_mode]
          end
        end
      end
    end
  end
end
