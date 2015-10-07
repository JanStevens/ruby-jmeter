module RubyJmeter
  module Nodes
    module Assertations
      class HtmlAssertion < Nodes::Base
        defaults error_threshold: 0, warning_threshold: 0,
          html_assertion_doctype: :omit, errors_only: false, html_assertion_format: 0
        allowed %i(error_threshold warning_threshold html_assertion_doctype
          errors_only html_assertion_format html_assertion_filename)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <HTMLAssertion guiclass="HTMLAssertionGui" testclass="HTMLAssertion" testname="" enabled="true">
            <longProp name="html_assertion_error_threshold" />
            <longProp name="html_assertion_warning_threshold" />
            <stringProp name="html_assertion_doctype" />
            <boolProp name="html_assertion_errorsonly" />
            <longProp name="html_assertion_format" />
            <stringProp name="html_assertion_filename"/>
          </HTMLAssertion>
          XML
        end
      end
    end
  end
end
