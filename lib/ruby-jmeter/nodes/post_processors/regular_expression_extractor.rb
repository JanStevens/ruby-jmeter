module RubyJmeter
  module Nodes
    module PostProcessors
      class RegularExpressionExtractor < Nodes::Base
        defaults use_headers: false, scope: 'main'
        allowed %i(use_headers refname regex template default match_number scope variable)

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.RegexExtractor(guiclass: "RegexExtractorGui", testclass: "RegexExtractor", testname: params[:name], enabled: true) do
              string(xml, params[:useHeaders], name: 'RegexExtractor.useHeaders')
              string(xml, params[:refname], name: 'RegexExtractor.refname')
              string(xml, params[:regex], name: 'RegexExtractor.regex')
              string(xml, params[:template], name: 'RegexExtractor.template')
              string(xml, params[:default], name: 'RegexExtractor.default')
              string(xml, params[:match_number], name: 'RegexExtractor.match_number')
              if params[:variable]
                string(xml, 'variable', name: 'Sample.scope')
                string(xml, params[:variable], name: 'Scope.variable')
              elsif params[:scope] != 'main'
                string(xml, params[:scope], name: 'Scope.scope')
              end
            end
          end.doc
        end

        def exclude_in_xml
          %i(use_headers refname regex template default match_number scope variable)
        end
      end
    end
  end
end
