module RubyJmeter
  module Nodes
    module ConfigElements
      class HttpHeaderManager < Nodes::Base
        allowed %i(headers)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
            <HeaderManager guiclass="HeaderPanel" testclass="HeaderManager" testname="" enabled="true">
              #{Partials::CollectionProp.call(xml_template, params[:headers])}
            </HeaderManager>
          XML
        end

        def exclude_in_xml
          %i(headers)
        end

        def xml_template
          {
            collection: {
              name: 'HeaderManager.headers',
            },
            element: {
              name: '',
              elementType: 'Header',
              attributes: [
                { key: :header,
                  type: 'stringProp',
                  name: 'Header.name',
                },
                { key: :value,
                  type: 'stringProp',
                  name: 'Header.value'
                }
              ]
            }
          }
        end
      end
    end
  end
end
