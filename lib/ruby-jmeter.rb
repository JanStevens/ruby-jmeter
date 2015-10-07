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

require 'ruby-jmeter/version'
require 'ruby-jmeter/helpers/helper'
require 'ruby-jmeter/nodes/partials/basic'
require 'ruby-jmeter/helpers/parser'
require 'ruby-jmeter/helpers/fallback_content_proxy'
require 'ruby-jmeter/helpers/logger-colors'
require 'ruby-jmeter/helpers/strip-heredoc'
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

require 'ruby-jmeter/dsl'
