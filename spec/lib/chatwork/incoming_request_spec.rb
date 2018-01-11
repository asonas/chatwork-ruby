describe ChatWork::IncomingRequest do
  describe ".get", type: :api do
    subject { ChatWork::IncomingRequest.get }

    before do
      stub_chatwork_request(:get, "/incoming_requests")
    end

    it_behaves_like :a_chatwork_api, :get, "/incoming_requests"
  end
end
