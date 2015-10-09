module RubyJmeter
  module Nodes
    module Plugins
      class GraphsGenerator < Nodes::Base
        defaults aggregate_rows: false, auto_scale_rows: false, exclude_samples_with_regex: false, export_mode: 0,
          granulation: 60000, graph_height: 600, graph_width: 800, include_samples_with_regex: false, limit_rows: 150,
          paint_gradient: true, paint_zeroing: true, prevent_outliers: false, relative_timers: false, paint_markers: true

        allowed %i(aggregate_rows auto_scale_rows end_offset exclude_labels exclude_samples_with_regex export_mode
          file_prefix force_y granulation graph_height graph_width include_labels include_samples_with_regex limit_rows line_weight
          low_count_limit output_base_folder paint_gradient paint_zeroing prevent_outliers
          relative_timers results_file_name start_offset success_filter
          paint_markers)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <kg.apc.jmeter.listener.GraphsGeneratorListener guiclass="TestBeanGUI" testclass="kg.apc.jmeter.listener.GraphsGeneratorListener" testname="" enabled="true">
              <boolProp name="aggregateRows" />
              <boolProp name="autoScaleRows" />
              <stringProp name="endOffset" />
              <stringProp name="excludeLabels" />
              <boolProp name="excludeSamplesWithRegex" />
              <intProp name="exportMode" />
              <stringProp name="filePrefix" />
              <stringProp name="forceY" />
              <stringProp name="granulation" />
              <intProp name="graphHeight" />
              <intProp name="graphWidth" />
              <stringProp name="includeLabels" />
              <boolProp name="includeSamplesWithRegex" />
              <stringProp name="limitRows" />
              <stringProp name="lineWeight" />
              <stringProp name="lowCountLimit" />
              <stringProp name="outputBaseFolder" />
              <boolProp name="paintGradient" />
              <boolProp name="paintZeroing" />
              <boolProp name="preventOutliers" />
              <boolProp name="relativeTimes" />
              <stringProp name="resultsFileName" />
              <stringProp name="startOffset" />
              <stringProp name="successFilter" />
              <stringProp name="paintMarkers" />
            </kg.apc.jmeter.listener.GraphsGeneratorListener>
          XML
        end
      end
    end
  end
end
