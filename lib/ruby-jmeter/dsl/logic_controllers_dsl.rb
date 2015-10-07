module RubyJmeter
  module DSL
    module LogicControllersDSL
      def exists(variable, &block)
        params ||= {}
        params[:condition] = "\"${#{variable}}\" != \"\\${#{variable}}\""
        params[:useExpression] = false
        params[:name] = "if ${#{variable}}"
        node = RubyJmeter::Nodes::LogicControllers::IfController.call(params)
        attach_node(node, &block)
      end

      def throughput_controller(params, &block)
        params[:style] = 1 if params[:percent]
        params[:maxThroughput] = params[:total] || params[:percent] || 1
        node = RubyJmeter::Nodes::LogicControllers::ThroughputController.call(params)
        node.doc.xpath(".//FloatProperty/value").first.content = params[:maxThroughput].to_f
        attach_node(node, &block)
      end
    end
  end
end
