describe ChatWork::Message do
  describe ".get", type: :api do
    subject { ChatWork::Message.get(room_id: room_id, force: force) }

    let(:room_id) { 123 }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}/messages", "/rooms/{room_id}/messages")
    end

    context "when force is Integer" do
      let(:force) { 0 }

      it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}/messages"
    end

    context "when force is boolean" do
      let(:force) { false }

      it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}/messages"
    end
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

  describe ".read", type: :api do
    subject { ChatWork::Message.read(room_id: room_id, message_id: message_id) }

    let(:room_id)    { 123 }
    let(:message_id) { "101" }

    before do
      stub_chatwork_request(:put, "/rooms/#{room_id}/messages/read", "/rooms/{room_id}/messages/read")
    end

    it_behaves_like :a_chatwork_api, :put, "/rooms/{room_id}/messages/read"
  end

  describe ".unread", type: :api do
    subject { ChatWork::Message.unread(room_id: room_id, message_id: message_id) }

    let(:room_id)    { 123 }
    let(:message_id) { "101" }

    before do
      stub_chatwork_request(:put, "/rooms/#{room_id}/messages/unread", "/rooms/{room_id}/messages/unread")
    end

    it_behaves_like :a_chatwork_api, :put, "/rooms/{room_id}/messages/unread"
  end
end
