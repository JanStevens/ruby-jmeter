module RubyJmeter
  module Nodes
    class AssignParamsInNode
      include Procto.call

      attr_reader :doc, :params

      def initialize(params = {}, doc)
        @params = params
        @doc = doc
      end

      def call
        set_node_name
        enable_or_disable_node
        if params.is_a?(Array)
          update_array_collection
        else
          update_hash_collection
        end
        update_at_xpath if params[:update_at_xpath]
      end

      private

      def enable_or_disable_node
        return unless params.is_a?(Hash)
        doc.children.first.attributes['enabled'].value = params[:enabled].to_s == 'true' ? 'true' : 'false'
      end

      def set_node_name
        doc.children.first.attributes['testname'].value = params[:test_name] || params[:testName]
        params.delete(:test_name)
        params.delete(:testName)
      end

      def update_array_collection
        elements = doc.at_xpath("//collectionProp/elementProp".freeze)
        params.each_with_index do |param, index|
          param.each do |name, value|
            next unless elements && elements.element_children
            element = elements.element_children.xpath("//*[contains(@name,\"#{name}\")]")
            element.last.content = value
          end
          if index != params.size - 1 && elements
            doc.at_xpath("//collectionProp".freeze) << elements.dup
          end
        end
      end

      def update_hash_collection
        params.each do |name, value|
          node = doc.children.xpath("//*[contains(@name,\"#{name.to_s}\")]")
          if value.is_a?(Nokogiri::XML::Builder)
            node.first << value.doc.at_xpath('//builder'.freeze).children
          else
            node.first.content = value unless node.empty?
          end
        end
      end

      def update_at_xpath
        params[:update_at_xpath].each do |fragment|
          if fragment[:xpath]
            doc.at_xpath(fragment[:xpath]) << fragment[:value]
          else
            fragment.each do |xpath, value|
              doc.at_xpath(xpath).content = value
            end
          end
        end
      end
    end
  end
end
