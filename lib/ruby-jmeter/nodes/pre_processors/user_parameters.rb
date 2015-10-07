module RubyJmeter
  module Nodes
    module PreProcessors
      class UserParameters < Nodes::Base
        defaults per_iteration: false
        allowed %i(names thread_values per_iteration)

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.UserParameters(guiclass: 'UserParametersGui', testclass: 'UserParameters', testname: params[:name], enabled: true) do
              collection(xml, name: 'UserParameters.names') do
                params[:names].each do |name|
                  string xml, name: name
                end
              end
              collection(xml, name: 'UserParameters.thread_values') do
                params[:thread_values].map.with_index do |value, idx|
                  string xml, value, name: idx
                end
              end
              bool xml, params[:per_iteration], name: 'UserParameters.per_iteration'
            end
          end.doc
        end

        def exclude_in_xml
          %i(names thread_values)
        end
      end
    end
  end
end
