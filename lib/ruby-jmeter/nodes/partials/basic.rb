module RubyJmeter
  module Nodes
    module Partials
      module Basic
        %i(string int long bool).each do |method|
          define_method method do |xml, value = nil, attributes = {}, &block|
            xml.send("#{method}Prop", value, attributes, &block)
          end
        end

        def element(xml, attributes = {}, &block)
          xml.elementProp(attributes, &block)
        end

        def collection(xml, attributes = {}, &block)
          xml.collectionProp(attributes, &block)
        end

        def obj_prop(xml, attributes = {})
          RubyJmeter::Nodes::Partials::ObjProp.call(xml, attributes)
        end
      end
    end
  end
end
