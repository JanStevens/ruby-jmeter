module RubyJmeter
  module Nodes
    module PreProcessors
      class RegexUserParameters < Nodes::Base
        allowed %i(regex_ref_name param_names_gr_nr param_values_gr_nr)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <RegExUserParameters guiclass="RegExUserParametersGui" testclass="RegExUserParameters" testname="" enabled="true">
            <stringProp name="RegExUserParameters.regex_ref_name"/>
            <stringProp name="RegExUserParameters.param_names_gr_nr"/>
            <stringProp name="RegExUserParameters.param_values_gr_nr"/>
          </RegExUserParameters>
          XML
        end
      end
    end
  end
end
