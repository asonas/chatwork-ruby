describe ChatWork::Token do
  describe '.refresh_access_token', :pending do
    subject { ChatWork::Token.refresh_access_token(refresh_token, scope) }

    let(:scope) { [] }

    its(["access_token"])  { should eq "new_access_token" }
    its(["token_type"])    { should eq "Bearer" }
    its(["expires_in"])    { should eq "1800" }
    its(["refresh_token"]) { should eq "refresh_token" }
    its(["scope"])         { should eq "users.all:read rooms.all:read_write contacts.all:read_write" }
  end
end
