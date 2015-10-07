module RubyJmeter
  module Nodes
    module Samplers
      class FtpRequest < Nodes::Base
        defaults binarymode: false, saveresponse: false, upload: false
        allowed %i(server port filename localfilename inputdata binarymode
          saveresponse upload username password)

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <FTPSampler guiclass="FtpTestSamplerGui" testclass="FTPSampler" testname="" enabled="true">
            <stringProp name="FTPSampler.server"/>
            <stringProp name="FTPSampler.port"/>
            <stringProp name="FTPSampler.filename"/>
            <stringProp name="FTPSampler.localfilename"/>
            <stringProp name="FTPSampler.inputdata"/>
            <boolProp name="FTPSampler.binarymode" />
            <boolProp name="FTPSampler.saveresponse" />
            <boolProp name="FTPSampler.upload" />
            <stringProp name="ConfigTestElement.username"/>
            <stringProp name="ConfigTestElement.password"/>
          </FTPSampler>
          XML
        end
      end
    end
  end
end
