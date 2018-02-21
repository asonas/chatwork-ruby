describe ChatWork::Client::MyStatusMethods do
  describe "#get_my_status", type: :api do
    subject { client.get_my_status(&block) }

    before do
      stub_chatwork_request(:get, "/my/status")
    end

    it_behaves_like :a_chatwork_api, :get, "/my/status"
  end
end
