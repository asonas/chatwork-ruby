describe ChatWork::ChatWorkError do
  describe ".from_response" do
    subject { ChatWork::ChatWorkError.from_response(status, Hashie::Mash.new(body), headers) }

    context "with WWW-Authenticate header" do
      let(:status) { 401 }

      let(:body) do
        {
          errors: ["Invalid API Token"],
        }
      end

      let(:headers) do
        {
          "WWW-Authenticate" => 'Bearer error="invalid_token", error_description="The access token expired"',
        }
      end

      it { should be_an_instance_of ChatWork::AuthenticateError }
      its(:error) { should eq "invalid_token" }
      its(:error_description) { should eq "The access token expired" }
      its(:error_response) { should eq ["Invalid API Token"] }
    end

    context "with error" do
      let(:status) { 401 }

      let(:body) do
        {
          error:             "invalid_client",
          error_description: "The client ID `client_id` is unknown.",
          error_uri:         nil,
        }.stringify_keys
      end

      let(:headers) { {} }

      it { should be_an_instance_of ChatWork::AuthenticateError }
      its(:message)           { should eq "invalid_client The client ID `client_id` is unknown." }
      its(:error)             { should eq "invalid_client" }
      its(:error_description) { should eq "The client ID `client_id` is unknown." }
      its(:error_response)    { should eq body }
    end
  end

  describe ChatWork::AuthenticateError do
    describe ".from_www_authenticate" do
      subject do
        ChatWork::AuthenticateError.from_www_authenticate(
          www_authenticate: www_authenticate,
          status:           status,
          error_response:   error_response,
        )
      end

      let(:www_authenticate) { 'Bearer error="invalid_token", error_description="The access token expired"' }
      let(:status)           { 401 }
      let(:error_response)   { ["Invalid API Token"] }

      it { should be_an_instance_of ChatWork::AuthenticateError }
      its(:error)             { should eq "invalid_token" }
      its(:error_description) { should eq "The access token expired" }
      its(:error_response)    { should eq ["Invalid API Token"] }
    end
  end
end
