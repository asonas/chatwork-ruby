describe ChatWork::Member do
  describe ".get", type: :api do
    subject { ChatWork::Member.get(room_id: room_id) }

    let(:room_id) { 123 }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}/members", "/rooms/{room_id}/members")
    end

    it_behaves_like :a_chatwork_api do
      let(:verb)     { :get }
      let(:resource) { "/rooms/{room_id}/members" }
    end
  end
end
