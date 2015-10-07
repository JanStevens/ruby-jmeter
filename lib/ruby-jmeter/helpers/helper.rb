module RubyJmeter
  def dsl_eval(dsl, &block)
    block_context = eval("self", block.binding)
    proxy_context = RubyJmeter::FallbackContextProxy.new(dsl, block_context)
    begin
      block_context.instance_variables.each do |ivar|
        proxy_context.instance_variable_set(ivar, block_context.instance_variable_get(ivar))
      end
      proxy_context.instance_eval(&block)
    ensure
      block_context.instance_variables.each do |ivar|
        block_context.instance_variable_set(ivar, proxy_context.instance_variable_get(ivar))
      end
    end
    dsl
  end
  module_function :dsl_eval
end
