module RubyJmeter
  module Nodes
    module LogicControllers
      class ModuleController < Nodes::Base
        allowed :node_path

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.ModuleController(guiclass: 'ModuleControllerGui', testclass: 'ModuleController', testname: params[:name], enabled: true) do
              collection xml, name: 'ModuleController.node_path' do
                Array(params[:node_path]).map.with_index do |node, index|
                  string xml, node, name: "node_#{index}"
                end
              end
            end
          end.doc
        end

        def exclude_in_xml
          %i(node_path)
        end
      end
    end
  end
end
