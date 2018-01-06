describe ChatWork::Token do
  describe ".refresh_access_token" do
    subject { ChatWork::Token.refresh_access_token(refresh_token, scope) }

    before do
      allow(ChatWork).to receive(:client_id)     { client_id }
      allow(ChatWork).to receive(:client_secret) { client_secret }

      stub_request(:post, "https://oauth.chatwork.com/token").
        with(body: {"grant_type" => "refresh_token", "refresh_token" => refresh_token},
             headers: {"Authorization" => "Basic #{signature}", "Content-Type" => "application/x-www-form-urlencoded"}).
        to_return(status: 200, body: token.to_json, headers: { "Content-Type" => "application/json" })
    end

    let(:client_id)     { "client_id" }
    let(:client_secret) { "client_secret" }
    let(:refresh_token) { "refresh_token" }
    let(:signature)     { "Y2xpZW50X2lkOmNsaWVudF9zZWNyZXQ=" }
    let(:scope)         { [] }
    let(:token) do
      {
        access_token:  "new_access_token",
        token_type:    "Bearer",
        expires_in:    "1800",
        refresh_token: refresh_token,
        scope:         "users.all:read rooms.all:read_write contacts.all:read_write",
      }
    end

    its(["access_token"])  { should eq "new_access_token" }
    its(["token_type"])    { should eq "Bearer" }
    its(["expires_in"])    { should eq "1800" }
    its(["refresh_token"]) { should eq refresh_token }
    its(["scope"])         { should eq "users.all:read rooms.all:read_write contacts.all:read_write" }
  end
end
