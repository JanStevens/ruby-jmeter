module RubyJmeter
  module Nodes
    module ConfigElements
      class FtpRequestDefaults < Nodes::Base
        defaults binary_mode: false, save_response: false, upload: false
        allowed %i(server port filename local_filename input_data binary_mode save_response upload)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <ConfigTestElement guiclass="FtpConfigGui" testclass="ConfigTestElement" testname="" enabled="true">
            <stringProp name="FTPSampler.server"/>
            <stringProp name="FTPSampler.port"/>
            <stringProp name="FTPSampler.filename"/>
            <stringProp name="FTPSampler.localfilename"/>
            <stringProp name="FTPSampler.inputdata"/>
            <boolProp name="FTPSampler.binarymode" />
            <boolProp name="FTPSampler.saveresponse" />
            <boolProp name="FTPSampler.upload" />
          </ConfigTestElement>
          XML
        end
      end
    end
  end
end
