module RubyJmeter
  module Nodes
    module Assertations
      class HtmlAssertion < Nodes::Base
        defaults error_threshold: 0, warning_threshold: 0,
          doctype: :omit, errors_only: false, format: :html
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.HTMLAssertion guiclass: 'HTMLAssertionGui', testclass: 'HTMLAssertion',
              testname: attributes[:test_name], enabled: attributes[:enabled] do
              long(xml, attributes[:error_threshold], name: 'html_assertion_error_threshold')
              long(xml, attributes[:warning_threshold], name: 'html_assertion_warning_threshold')
              string(xml, attributes[:doctype], name: 'html_assertion_doctype')
              bool(xml, attributes[:errors_only], name: 'html_assertion_errorsonly')
              long(xml, convert_format(attributes[:format]), name: 'html_assertion_format')
              string(xml, attributes[:filename], name: 'html_assertion_filename')
            end
          end.doc
        end

        def convert_format(format)
          if format == :html
            0
          elsif format == :xhtml
            1
          else
            2
          end
        end
      end
    end
  end
end
