module RubyJmeter
  module Nodes
    module PostProcessors
      class CssjqueryExtractor < Nodes::Base
        allowed %i(refname expr attribute default match_number extractor_impl)
        skip_conversion!

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <HtmlExtractor guiclass="HtmlExtractorGui" testclass="HtmlExtractor" testname="" enabled="true">
              <stringProp name="HtmlExtractor.refname"/>
              <stringProp name="HtmlExtractor.expr"/>
              <stringProp name="HtmlExtractor.attribute"/>
              <stringProp name="HtmlExtractor.default"/>
              <stringProp name="HtmlExtractor.match_number"/>
              <stringProp name="HtmlExtractor.extractor_impl"/>
            </HtmlExtractor>
          XML
        end
      end
    end
  end
end
