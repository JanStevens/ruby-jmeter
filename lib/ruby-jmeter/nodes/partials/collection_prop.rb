module RubyJmeter
  module Nodes
    module Partials
      class CollectionProp
        include Procto.call
        attr_reader :element_props, :template

        def initialize(template, element_props)
          @element_props = Array(element_props)
          @template = template
        end

        def call
          Nokogiri::XML::Builder.new do |xml|
            xml.collectionProp(name: template[:collection][:name]) do
              element_props.each do |element_prop|
                ElementProp.call(xml, template[:element], element_prop)
              end
            end
          end.doc.root.to_xml
        end
      end
    end
  end
end
