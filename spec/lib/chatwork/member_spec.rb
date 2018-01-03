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

  describe 'get room members', :pending do
    it 'should work' do
      expect(ChatWork::Member.get(room_id: 1)).to eq([{ "account_id"=> 123,  "name"=> "John Smith"}])
    end

    it 'should work with block' do
      ChatWork::Member.get(room_id: 1) do |body, headers|
        expect(body).to eq([{ "account_id"=> 123,  "name"=> "John Smith"}])
        expect(headers).to eq({'X-ratelimit-limit'=> '100', 'X-ratelimit-remaining'=> '44'})
      end
    end
  end
end
