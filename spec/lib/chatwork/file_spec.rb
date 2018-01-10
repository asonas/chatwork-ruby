describe ChatWork::File do
  describe ".get", type: :api do
    subject { ChatWork::File.get(room_id: room_id, account_id: account_id) }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}/files", "/rooms/{room_id}/files")
    end

    let(:room_id)    { 123 }
    let(:account_id) { 101 }

    it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}/files"
  end
end
