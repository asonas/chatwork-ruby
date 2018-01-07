describe ChatWork::Me do
  describe ".get", type: :api do
    subject { ChatWork::Me.get }

    before do
      stub_chatwork_request(:get, "/me")
    end

    it_behaves_like :a_chatwork_api, :get, "/me"
  end
end
