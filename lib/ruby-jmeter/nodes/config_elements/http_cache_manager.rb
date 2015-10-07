module RubyJmeter
  module Nodes
    module ConfigElements
      class HttpCacheManager < Nodes::Base
        defaults use_expires: false, clear_each_iteration: false
        allowed %i(clear_each_iteration use_expires)
        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <CacheManager guiclass="CacheManagerGui" testclass="CacheManager" testname="" enabled="true">
            <boolProp name="clearEachIteration" />
            <boolProp name="useExpires" />
          </CacheManager>
          XML
        end
      end
    end
  end
end
