describe ChatWork::IncomingRequest do
  describe ".get", type: :api do
    subject { ChatWork::IncomingRequest.get(&block) }

    before do
      stub_chatwork_request(:get, "/incoming_requests")
    end

    it_behaves_like :a_chatwork_api, :get, "/incoming_requests"
  end

  describe ".update", type: :api do
    subject { ChatWork::IncomingRequest.update(request_id: request_id, &block) }

    let(:request_id) { 123 }

    before do
      stub_chatwork_request(:put, "/incoming_requests/#{request_id}", "/incoming_requests/{request_id}")
    end

    it_behaves_like :a_chatwork_api, :put, "/incoming_requests/{request_id}"
  end

  describe ".destroy", type: :api do
    subject { ChatWork::IncomingRequest.destroy(request_id: request_id, &block) }

    let(:request_id) { 123 }

    before do
      stub_chatwork_request(:delete, "/incoming_requests/#{request_id}", "/incoming_requests/{request_id}", 204)
    end

    it_behaves_like :a_chatwork_api, :delete, "/incoming_requests/{request_id}", 204
  end
end
