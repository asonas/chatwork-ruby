describe ChatWork::ChatWorkError do
  describe '.from_response' do
    subject { ChatWork::ChatWorkError.from_response(status, body, headers) }

    context "with WWW-Authenticate header" do
      let(:status) { 401 }

      let(:body) do
        <<-JSON
          {"errors":["Invalid API Token"]}
        JSON
      end

      let(:headers) do
        {
          'WWW-Authenticate' => 'Bearer error="invalid_token", error_description="The access token expired"'
        }
      end

      it { should be_an_instance_of ChatWork::AuthenticateError }
      its(:error) { should eq 'invalid_token' }
      its(:error_description) { should eq 'The access token expired' }
      its(:error_response) { should eq ['Invalid API Token'] }
    end
  end
end
