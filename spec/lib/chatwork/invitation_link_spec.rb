describe ChatWork::InvitationLink do
  describe ".get", type: :api do
    subject { ChatWork::InvitationLink.get(room_id: room_id) }

    let(:room_id) { 123 }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}/link", "/rooms/{room_id}/link")
    end

    it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}/link"
  end
end
