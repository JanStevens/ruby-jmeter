module RubyJmeter
  module DSL
    module ThreadsDSL

      def thread_group(params = {}, &block)
        params[:num_threads] = params.delete(:count) || 1
        params[:ramp_time] = params[:rampup] || (params[:num_threads]/2.0).ceil
        params[:start_time] = params[:start_time] || Time.now.to_i * 1000
        params[:end_time] = params[:end_time] || Time.now.to_i * 1000
        params[:duration] ||= 60
        params[:continue_forever] ||= false
        params[:loops] = -1 if params[:continue_forever]
        super(params, &block)
      end
      alias_method :threads, :thread_group

      def setup_thread_group(params = {}, &block)
        params[:num_threads] = params[:count] || 1
        params[:ramp_time] = params[:rampup] || (params[:num_threads]/2.0).ceil
        params[:start_time] = params[:start_time] || Time.now.to_i * 1000
        params[:end_time] = params[:end_time] || Time.now.to_i * 1000
        params[:duration] ||= 60
        params[:continue_forever] ||= false
        params[:loops] = -1 if params[:continue_forever]
        super(params, &block)
      end
    end
  end
end
