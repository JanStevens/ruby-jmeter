module RubyJmeter
  module Nodes
    module PreProcessors
      class JdbcPreprocessor < Nodes::Base
        defaults queryType: 'Select Statement', resultSetHandler: 'Store as String'
        allowed %i(dataSource query queryArguments queryArgumentsTypes queryType
          resultVariable variableNames queryTimeout resetSetHandler)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <JDBCPreProcessor guiclass="TestBeanGUI" testclass="JDBCPreProcessor" testname="" enabled="true">
            <stringProp name="dataSource"/>
            <stringProp name="query"/>
            <stringProp name="queryArguments"/>
            <stringProp name="queryArgumentsTypes"/>
            <stringProp name="queryType" />
            <stringProp name="resultVariable"/>
            <stringProp name="variableNames"/>
            <stringProp name="queryTimeout"/>
            <stringProp name="resultSetHandler" />
          </JDBCPreProcessor>
          XML
        end
      end
    end
  end
end
