require 'time'
require 'logger'

module RubyJmeter
  module Logging
    class Pretty < Logger::Formatter
      SEVERITY_TO_COLOR_MAP = { 'DEBUG' => '0;37',
        'INFO' => '32', 'WARN' => '33', 'ERROR' => '31', 'FATAL' => '31', 'UNKNOWN' => '37' }.freeze

      def call(severity, time, program_name, message)
        formatted_severity = sprintf("%-5s",severity)
        color = SEVERITY_TO_COLOR_MAP[severity]

        "#{time.utc.iso8601(3)} #{program_name} [\033[#{color}m#{formatted_severity}\033[0m]: #{message.strip} \n"
      end
    end

    def self.initialize_logger(log_target = STDOUT)
      oldlogger = defined?(@logger) ? @logger : nil
      @logger = Logger.new(log_target)
      @logger.level = Logger::DEBUG
      @logger.formatter = Pretty.new
      oldlogger.close if oldlogger && !$TESTING # don't want to close testing's STDOUT logging
      @logger
    end

    def self.logger
      defined?(@logger) ? @logger : initialize_logger
    end

    def self.logger=(log)
      @logger = (log ? log : Logger.new('/dev/null'))
    end

    def logger
      RubyJmeter::Logging.logger
    end
  end
end
