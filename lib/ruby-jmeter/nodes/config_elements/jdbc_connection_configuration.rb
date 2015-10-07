module RubyJmeter
  module Nodes
    module ConfigElements
      class JdbcConnectionConfiguration < Nodes::Base
        defaults auto_commit: true, check_query: 'Select 1', connection_age: 5000, keep_alive: true,
          pool_max: 10, timeout: 10000, transaction_isolation: 'DEFAULT', trim_interval: 60000
        allowed %i(auto_commit check_query connection_age data_source db_url driver keep_alive password
          pool_max timeout transaction_isolation trim_interval username)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <JDBCDataSource guiclass="TestBeanGUI" testclass="JDBCDataSource" testname="" enabled="true">
              <boolProp name="autocommit" />
              <stringProp name="checkQuery" />
              <stringProp name="connectionAge" />
              <stringProp name="dataSource"/>
              <stringProp name="dbUrl"/>
              <stringProp name="driver"/>
              <boolProp name="keepAlive" />
              <stringProp name="password"/>
              <stringProp name="poolMax" />
              <stringProp name="timeout" />
              <stringProp name="transactionIsolation" />
              <stringProp name="trimInterval" />
              <stringProp name="username" />
            </JDBCDataSource>
          XML
        end
      end
    end
  end
end
