module RubyJmeter
  module Nodes
    module Times
      class ConstantThroughputTimer < Nodes::Base
        defaults mode: 0, value: 0.0
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.ConstantThroughputTimer(guiclass: 'TestBeanGUI', testclass: 'ConstantThroughputTimer',
              testname: params[:test_name], enabled: params[:enabled]) do
              int xml, convert_calcmode, name: 'calcMode'
              double(xml) do
                xml.name 'throughput'
                xml.value params[:value]
                xml.savedValue params[:value]
              end
            end
          end.doc
        end

        def convert_calcmode
          calc_mode = params[:mode]
          case calc_mode
            when :this_thread then
              0
            when :all_threads then
              1
            when :all_threads_group then
              2
            when :all_threads_shared then
              3
            when :all_threads_group_shared then
              4
            else
              0
          end
        end
      end
    end
  end
end
