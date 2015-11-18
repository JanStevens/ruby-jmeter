module RubyJmeter
  module Nodes
    module ConfigElements
      class FtpRequestDefaults < Nodes::Base
        defaults binary_mode: false, save_response: false, upload: false
        uses_new_syntax!

        def node
          Nokogiri::XML::Builder.new do |xml|
            xml.ConfigTestElement guiclass: "FtpConfigGui", testclass: "ConfigTestElement",
              testname: attributes[:test_name], enabled: attributes[:enabled] do
              string(xml, attributes[:server], name: "FTPSampler.server")
              string(xml, attributes[:port], name: "FTPSampler.port")
              string(xml, attributes[:filename], name: "FTPSampler.filename")
              string(xml, attributes[:local_filename], name: "FTPSampler.localfilename")
              string(xml, attributes[:input_data], name: "FTPSampler.inputdata")
              bool(xml, attributes[:binary_mode], name: "FTPSampler.binarymode")
              bool(xml, attributes[:save_response], name: "FTPSampler.saveresponse")
              bool(xml, attributes[:upload], name: "FTPSampler.upload")
            end
          end.doc
        end
      end
    end
  end
end
