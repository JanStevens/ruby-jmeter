module RubyJmeter
  module Nodes
    module Samplers
      class JdbcRequest < Nodes::Base
        defaults queryType: 'Select Statement', resultSetHandler: 'Store as String'
        allowed %i(dataSource query queryArguments queryArgumentsTypes queryType
          resultVariable variableNames queryTimeout resultSetHandler)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <JDBCSampler guiclass="TestBeanGUI" testclass="JDBCSampler" testname="" enabled="true">
            <stringProp name="dataSource"/>
            <stringProp name="query"/>
            <stringProp name="queryArguments"/>
            <stringProp name="queryArgumentsTypes"/>
            <stringProp name="queryType" />
            <stringProp name="resultVariable"/>
            <stringProp name="variableNames"/>
            <stringProp name="queryTimeout"/>
            <stringProp name="resultSetHandler" />
          </JDBCSampler>
          XML
        end
      end
    end
  end
end
