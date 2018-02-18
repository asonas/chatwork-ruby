describe ChatWork::Member do
  describe ".get", type: :api do
    subject { ChatWork::Member.get(room_id: room_id, &block) }

    let(:room_id) { 123 }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}/members", "/rooms/{room_id}/members")
    end

    it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}/members"
  end

  describe ".update_all", type: :api do
    subject do
      ChatWork::Member.update_all(
        room_id:              room_id,
        members_admin_ids:    members_admin_ids,
        members_member_ids:   members_member_ids,
        members_readonly_ids: members_readonly_ids,
        &block
      )
    end

    let(:room_id) { 123 }

    before do
      stub_chatwork_request(:put, "/rooms/#{room_id}/members", "/rooms/{room_id}/members")
    end

    context "with String" do
      let(:members_admin_ids)    { "123,542,1001" }
      let(:members_member_ids)   { "21,344" }
      let(:members_readonly_ids) { "15,103" }

      it_behaves_like :a_chatwork_api, :put, "/rooms/{room_id}/members"
    end

    context "with Array" do
      let(:members_admin_ids)    { [123, 542, 1001] }
      let(:members_member_ids)   { [21, 344] }
      let(:members_readonly_ids) { [15, 103] }

      it_behaves_like :a_chatwork_api, :put, "/rooms/{room_id}/members"
    end
  end
end
