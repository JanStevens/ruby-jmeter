module RubyJmeter
  module Nodes
    module ConfigElements
      class HttpCacheManager < Nodes::Base
        defaults use_expires: false, clear_each_iteration: false, max_size: 5000
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.CacheManager guiclass: "CacheManagerGui", testclass: "CacheManager",
              testname: attributes[:test_name], enabled: attributes[:enabled] do
              bool(xml, attributes[:clear_each_iteration], name: 'clearEachIteration')
              bool(xml, attributes[:use_expires], name: 'useExpires')
              int(xml, attributes[:max_size], name: 'maxSize')
            end
          end.doc
        end
      end
    end
  end
end
