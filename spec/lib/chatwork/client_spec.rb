describe ChatWork::Client do
  describe "#initialize" do
    subject { ChatWork::Client.new(api_key, access_token, api_base, api_version) }

    let(:api_key)      { nil }
    let(:access_token) { nil }
    let(:api_base)     { "https://api.chatwork.com/" }
    let(:api_version)  { "/v2" }

    context "with api_key" do
      let(:api_key) { "my_api_key" }

      it "client has X-ChatWorkToken header" do
        connection = subject.instance_variable_get(:@conn)

        expect(connection.headers["X-ChatWorkToken"]).to eq "my_api_key"
      end
    end

    context "with access_token" do
      let(:access_token) { "my_access_token" }

      it "client has Authorization header" do
        connection = subject.instance_variable_get(:@conn)

        expect(connection.headers["Authorization"]).to eq "Bearer my_access_token"
      end
    end

    context "without both api_key and access_token" do
      it { expect { subject }.to raise_error "Either api_key or access_token is required" }
    end
  end
end
