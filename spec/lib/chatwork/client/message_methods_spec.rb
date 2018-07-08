describe ChatWork::Client::MessageMethods do
  describe "#get_messages", type: :api do
    subject { client.get_messages(room_id: room_id, force: force, &block) }

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

  describe "#create_message", type: :api do
    subject { client.create_message(room_id: room_id, body: body, self_unread: self_unread, &block) }

    let(:room_id) { 123 }
    let(:body)    { "Hello ChatWork!" }
    let(:self_unread) { false }

    before do
      stub_chatwork_request(:post, "/rooms/#{room_id}/messages", "/rooms/{room_id}/messages")
    end

    it_behaves_like :a_chatwork_api, :post, "/rooms/{room_id}/messages"
  end

  describe "#read_message", type: :api do
    subject { client.read_message(room_id: room_id, message_id: message_id, &block) }

    let(:room_id)    { 123 }
    let(:message_id) { "101" }

    before do
      stub_chatwork_request(:put, "/rooms/#{room_id}/messages/read", "/rooms/{room_id}/messages/read")
    end

    it_behaves_like :a_chatwork_api, :put, "/rooms/{room_id}/messages/read"
  end

  describe "#unread_message", type: :api do
    subject { client.unread_message(room_id: room_id, message_id: message_id, &block) }

    let(:room_id)    { 123 }
    let(:message_id) { "101" }

    before do
      stub_chatwork_request(:put, "/rooms/#{room_id}/messages/unread", "/rooms/{room_id}/messages/unread")
    end

    it_behaves_like :a_chatwork_api, :put, "/rooms/{room_id}/messages/unread"
  end

  describe "#find_message", type: :api do
    subject { client.find_message(room_id: room_id, message_id: message_id, &block) }

    let(:room_id)    { 123 }
    let(:message_id) { "101" }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}/messages/#{message_id}", "/rooms/{room_id}/messages/{message_id}")
    end

    it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}/messages/{message_id}"
  end

  describe "#update_message", type: :api do
    subject { client.update_message(room_id: room_id, message_id: message_id, body: body, &block) }

    let(:room_id)    { 123 }
    let(:message_id) { "101" }
    let(:body)       { "Hello ChatWork!" }

    before do
      stub_chatwork_request(:put, "/rooms/#{room_id}/messages/#{message_id}", "/rooms/{room_id}/messages/{message_id}")
    end

    it_behaves_like :a_chatwork_api, :put, "/rooms/{room_id}/messages/{message_id}"
  end

  describe "#destroy_message", type: :api do
    subject { client.destroy_message(room_id: room_id, message_id: message_id, &block) }

    let(:room_id)    { 123 }
    let(:message_id) { "101" }

    before do
      stub_chatwork_request(:delete, "/rooms/#{room_id}/messages/#{message_id}", "/rooms/{room_id}/messages/{message_id}")
    end

    it_behaves_like :a_chatwork_api, :delete, "/rooms/{room_id}/messages/{message_id}"
  end
end
