module RubyJmeter
  module Nodes
    module Samplers
      class JunitRequest < Nodes::Base
        allowed %i(classname constructorstring method pkg.filter success success.code failure
          failure.code error error.code exec.setup append.error append.exception)

        defaults classname: 'test.RerunTest', method: 'testRerun', success: 'Test successful',
          'success.code': 1000, failure: 'Test failed', 'failure.code': '0001',
          error: 'An unexpected error occured', 'error.code': 9999, 'exec.setup': false,
          'append.error': false,  'append.exception': false

        def node
          Nokogiri::XML(<<-XML.strip_heredoc)
          <JUnitSampler guiclass="JUnitTestSamplerGui" testclass="JUnitSampler" testname="" enabled="true">
            <stringProp name="junitSampler.classname" />
            <stringProp name="junitsampler.constructorstring"/>
            <stringProp name="junitsampler.method" />
            <stringProp name="junitsampler.pkg.filter"/>
            <stringProp name="junitsampler.success" />
            <stringProp name="junitsampler.success.code" />
            <stringProp name="junitsampler.failure" />
            <stringProp name="junitsampler.failure.code" />
            <stringProp name="junitsampler.error" />
            <stringProp name="junitsampler.error.code" />
            <stringProp name="junitsampler.exec.setup" />
            <stringProp name="junitsampler.append.error" />
            <stringProp name="junitsampler.append.exception" />
          </JUnitSampler>
          XML
        end
      end
    end
  end
end
