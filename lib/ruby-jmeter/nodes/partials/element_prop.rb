module RubyJmeter
  module Nodes
    module Partials
      class ElementProp
        include Procto.call

        attr_reader :xml, :template, :attributes

        def initialize(xml, template, attributes = {})
          @xml = xml
          @template = template
          @attributes = attributes
        end

        def call
          xml.elementProp(name: element_name, elementType: template[:elementType], testname: template[:testname]) do
            attributes.each do |key, value|
              template[:attributes].each do |template_attribute|
                if key == template_attribute[:key]
                  render_attribute(xml, value || template_attribute[:value], template_attribute)
                end
              end
            end
          end
        end

        def render_attribute(xml, value, template)
          xml.send(template[:type], value, name: template[:name])
        end

        def element_name
          template[:name] || attributes[:name]
        end
      end
    end
  end
end
