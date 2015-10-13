module RubyJmeter
  module Nodes
    module Partials
      class ObjProp
        include Procto.call
        attr_reader :config, :xml

        CONFIG_ATTRIBUTES = {
          time: true,
          latency: true,
          timestamp: true,
          success: true,
          label: true,
          code: true,
          message: false,
          thread_name: true,
          data_type: false,
          encoding: false,
          assertions: false,
          subresults: false,
          response_data: false,
          sampler_data: false,
          xml: false,
          field_names: false,
          response_headers: false,
          request_headers: false,
          response_data_on_error: false,
          save_assertion_results_failure_message: false,
          assertions_results_to_save: 0,
          bytes: true,
          url: true,
          hostname: true,
          thread_counts: true,
          sample_count: true,
          idle_time: true,
          connect_time: true
        }

        def initialize(xml, config = {})
          @xml = xml
          @config = (config || {}).reverse_merge(CONFIG_ATTRIBUTES)
        end

        def call
          xml.objProp do
            xml.name 'saveConfig'
            xml.value class: 'SampleSaveConfiguration' do
              config.each do |key, value|
                xml.send(key.to_s.camelize(:lower).to_sym, value)
              end
            end
          end
        end
      end
    end
  end
end
