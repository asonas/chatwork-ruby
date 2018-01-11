describe ChatWork::Me do
  describe ".get", type: :api do
    subject { ChatWork::Me.get }

    before do
      stub_chatwork_request(:get, "/me")
    end

    it_behaves_like :a_chatwork_api, :get, "/me"

    its(:account_id)        { should eq 123 }
    its(:room_id)           { should eq 322 }
    its(:name)              { should eq "John Smith" }
    its(:chatwork_id)       { should eq "tarochatworkid" }
    its(:organization_id)   { should eq 101 }
    its(:organization_name) { should eq "Hello Company" }
    its(:department)        { should eq "Marketing" }
    its(:title)             { should eq "CMO" }
    its(:url)               { should eq "http://mycompany.example.com" }
    its(:introduction)      { should eq "Self Introduction" }
    its(:mail)              { should eq "taro@example.com" }
    its(:tel_organization)  { should eq "XXX-XXXX-XXXX" }
    its(:tel_extension)     { should eq "YYY-YYYY-YYYY" }
    its(:tel_mobile)        { should eq "ZZZ-ZZZZ-ZZZZ" }
    its(:skype)             { should eq "myskype_id" }
    its(:facebook)          { should eq "myfacebook_id" }
    its(:twitter)           { should eq "mytwitter_id" }
    its(:avatar_image_url)  { should eq "https://example.com/abc.png" }
    its(:login_mail)        { should eq "account@example.com" }

    context "when unauthorized" do
      before do
        stub_chatwork_request(:get, "/me", "/me", 401)
      end

      it { expect { subject }.to raise_error(ChatWork::APIError, "Invalid API token") }
    end
  end
end
