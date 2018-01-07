describe ChatWork::Message do
  describe ".get", type: :api do
    subject { ChatWork::Message.get(room_id: room_id, force: force) }

    let(:room_id) { 123 }
    let(:force)   { 0 }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}/messages", "/rooms/{room_id}/messages")
    end

    it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}/messages"
  end

  describe ".create", type: :api do
    subject { ChatWork::Message.create(room_id: room_id, body: body) }

    let(:room_id) { 123 }
    let(:body)    { "Hello ChatWork!" }

    before do
      stub_chatwork_request(:post, "/rooms/#{room_id}/messages", "/rooms/{room_id}/messages")
    end

    it_behaves_like :a_chatwork_api, :post, "/rooms/{room_id}/messages"
  end
end
