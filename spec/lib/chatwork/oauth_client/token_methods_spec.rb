describe ChatWork::OAuthClient::TokenMethods do
  let(:oauth_client) { ChatWork::OAuthClient.new(client_id: client_id, client_secret: client_secret) }

  describe ".refresh_access_token" do
    subject { oauth_client.refresh_access_token(refresh_token, scope) }

    let(:client_id)     { "client_id" }
    let(:client_secret) { "client_secret" }
    let(:refresh_token) { "refresh_token" }
    let(:signature)     { "Y2xpZW50X2lkOmNsaWVudF9zZWNyZXQ=" }
    let(:scope)         { [] }

    context "when successful" do
      before do
        stub_request(:post, "https://oauth.chatwork.com/token").
          with(body: { "grant_type" => "refresh_token", "refresh_token" => refresh_token },
               headers: { "Authorization" => "Basic #{signature}", "Content-Type" => "application/x-www-form-urlencoded" }).
          to_return(status: 200, body: token.to_json, headers: { "Content-Type" => "application/json" })
      end

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

    context "when failure" do
      before do
        stub_request(:post, "https://oauth.chatwork.com/token").
          with(body: { "grant_type" => "refresh_token", "refresh_token" => refresh_token },
               headers: { "Authorization" => "Basic #{signature}", "Content-Type" => "application/x-www-form-urlencoded" }).
          to_return(status: 401, body: body.to_json, headers: { "Content-Type" => "application/json" })
      end

      let(:body) do
        {
          error:             "invalid_client",
          error_description: "The client ID `client_id` is unknown.",
          error_uri:         nil,
        }
      end

      it { expect { subject }.to raise_error ChatWork::AuthenticateError }
    end
  end
end
