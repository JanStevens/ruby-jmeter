require 'nokogiri'
require 'rest_client'
require 'json'
require 'cgi'
require 'open3'
require 'procto'
require 'active_support/inflector'
require 'active_support/core_ext/hash/reverse_merge'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/string/strip'

require 'ruby-jmeter/version'
require 'ruby-jmeter/helpers/logging'
require 'ruby-jmeter/nodes/partials/basic'
require 'ruby-jmeter/helpers/parser'
require 'ruby-jmeter/helpers/user-agents'
require 'ruby-jmeter/nodes/assign_params_in_node'
require 'ruby-jmeter/nodes/base'


lib = File.dirname(File.absolute_path(__FILE__))
Dir.glob(File.join(lib, 'ruby-jmeter', 'nodes', '**', '*.rb')).each do |file|
  require file
end
Dir.glob(File.join(lib, 'ruby-jmeter', 'dsl', '**', '*.rb')).each do |file|
  require file
end


module RubyJmeter
  def self.logger
    RubyJmeter::Logging.logger
  end

  def self.logger=(log)
    RubyJmeter::Logging.logger = log
  end

  def self.test_plan(params = {}, &block)
    block_context = block.binding
    proxy_context = RubyJmeter::ExtendedDSL.new(params, block_context)
    Combinder.new(proxy_context, block_context).instance_eval(&block)
    proxy_context
  end

  class Combinder < BasicObject
    def initialize(object, saved_binding)
      @object = object
      @saved_binding = saved_binding
    end

    def __bound_self__
      @saved_binding.eval('self')
    end

    def method_missing(method, *args, &block)
      if @object.respond_to?(method)
        @object.__send__(method, *args, &block)
      else
        __bound_self__.__send__(method, *args, &block)
      end
    end

    def respond_to_missing?(method, include_all = false)
      __bound_self__.respond_to?(method) || @object.respond_to?(method)
    end
  end
end

require 'ruby-jmeter/dsl'
