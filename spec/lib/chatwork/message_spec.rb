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

  describe ".find", type: :api do
    subject { ChatWork::Message.find(room_id: room_id, message_id: message_id) }

    let(:room_id)    { 123 }
    let(:message_id) { "101" }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}/messages/#{message_id}", "/rooms/{room_id}/messages/{message_id}")
    end

    it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}/messages/{message_id}"
  end

  describe ".update", type: :api do
    subject { ChatWork::Message.update(room_id: room_id, message_id: message_id, body: body) }

    let(:room_id)    { 123 }
    let(:message_id) { "101" }
    let(:body)       { "Hello ChatWork!" }

    before do
      stub_chatwork_request(:put, "/rooms/#{room_id}/messages/#{message_id}", "/rooms/{room_id}/messages/{message_id}")
    end

    it_behaves_like :a_chatwork_api, :put, "/rooms/{room_id}/messages/{message_id}"
  end

  describe ".destroy", type: :api do
    subject { ChatWork::Message.destroy(room_id: room_id, message_id: message_id) }

    let(:room_id)    { 123 }
    let(:message_id) { "101" }

    before do
      stub_chatwork_request(:delete, "/rooms/#{room_id}/messages/#{message_id}", "/rooms/{room_id}/messages/{message_id}")
    end

    it_behaves_like :a_chatwork_api, :delete, "/rooms/{room_id}/messages/{message_id}"
  end
end
