module RubyJmeter
  module Nodes
    class Base
      include Procto.call
      include RubyJmeter::Nodes::Partials::Basic

      attr_reader :params, :doc

      def initialize(params = {})
        @params = params.reverse_merge!(default_params)
        convert_param_keys unless self.class.new_syntax?
        @doc = nil
      end

      def attributes
        @params
      end

      def call
        @doc = node
        unless self.class.new_syntax?
          params.except!(*exclude_in_xml)
          AssignParamsInNode.call(params, @doc)
        end
        @doc
      end

      def node
        Nokogiri::XML("<XmlTag></XmlTag")
      end

      def exclude_in_xml
        []
      end

      def convert_param_keys
        params.transform_keys! do |key|
          if self.class.params_mapping.present? && self.class.params_mapping[key]
            self.class.params_mapping[key]
          elsif self.class.convert?
            key.to_s.camelize(:lower).to_sym
          else
            key
          end
        end
      end

      def default_params
        self.class.default_params || self.class.defaults
      end

      def params_mapping
        self.class.params_mapping || {}
      end

      def allowed_params
        [
          self.class.allowed_params,
          default_params.keys,
          params_mapping.keys
        ].compact.inject(&:+).uniq
      end

      class << self
        attr_reader :default_params, :allowed_params, :params_mapping

        def inherited(base)
          @nodes ||= {}
          @nodes[register_as || demodulize_underscore(base)] = base
        end

        def demodulize_underscore(klass)
          klass.to_s.demodulize.underscore
        end

        # @DSL
        def register_as(name = nil)
          name
        end

        # @DSL
        def defaults(params = {})
          @default_params = params.reverse_merge(test_name: self.to_s.demodulize, enabled: true)
        end

        # @DSL
        def allowed(params = [])
          @allowed_params = (Array(params) + %i(update_at_xpath test_name enabled)).uniq
        end

        def mapping(params = {})
          @params_mapping = params
        end

        def skip_conversion!
          @skip_conversion = true
        end

        def uses_new_syntax!
          @new_syntax = true
        end

        def new_syntax?
          @new_syntax
        end

        def convert?
          !@skip_conversion
        end

        def all_nodes
          @nodes
        end
      end
    end
  end
end
