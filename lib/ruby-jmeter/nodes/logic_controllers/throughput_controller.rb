module RubyJmeter
  module Nodes
    module LogicControllers
      class ThroughputController < Nodes::Base
        defaults style: 0, per_thread: false, max_throughput: 1
        allowed %i(style per_thread max_throughput)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <ThroughputController guiclass="ThroughputControllerGui" testclass="ThroughputController" testname="" enabled="true">
            <intProp name="ThroughputController.style" />
            <boolProp name="ThroughputController.perThread" />
            <intProp name="ThroughputController.maxThroughput" />
            <FloatProperty>
              <name>ThroughputController.percentThroughput</name>
              <value>100.0</value>
              <savedValue>0.0</savedValue>
            </FloatProperty>
          </ThroughputController>
          XML
        end
      end
    end
  end
end
