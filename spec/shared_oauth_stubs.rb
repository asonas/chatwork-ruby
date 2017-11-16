require 'faraday'

RSpec.shared_context "shared oauth stubs" do
  let(:client_id) { 'client_id' }
  let(:client_secret) { 'client_secret' }
  let(:refresh_token) { 'refresh_token' }
  let(:api_version) { ChatWork.api_version }
  let(:oauth_api_base) { ChatWork.oauth_api_base }
  let(:signature) { 'Y2xpZW50X2lkOmNsaWVudF9zZWNyZXQ=' }

  let(:test_adapter) {
    token = {
      access_token: 'new_access_token',
      token_type: 'Bearer',
      expires_in: '1800',
      refresh_token: refresh_token,
      scope: 'users.all:read rooms.all:read_write contacts.all:read_write'
    }

    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post("/token") {
        [200,
        {"Content-Type" => "application/json"},
        token.to_json ]
      }
    end
  }

  let(:faraday) {
    default_header = {
      'Authorization': "Basic #{signature}",
      'User-Agent': "ChatWork#{api_version} RubyBinding/#{ChatWork::VERSION}"
    }
    Faraday.new(oauth_api_base, headers: default_header) do |builder|
      builder.request :url_encoded
      builder.adapter Faraday.default_adapter
      builder.adapter :test, test_adapter
    end
  }

  let(:oauth_client) {
    allow(Faraday).to receive(:new).and_return(faraday)
    ChatWork::OAuthClient.new(client_id, client_secret, oauth_api_base)
  }

  before(:each) do
    allow(ChatWork).to receive(:oauth_client).and_return(oauth_client)
  end
end
