describe ChatWork::Client::RoomMethods do
  describe "#get_rooms", type: :api do
    subject { client.get_rooms(&block) }

    let(:room_id) { 123 }

    before do
      stub_chatwork_request(:get, "/rooms")
    end

    it_behaves_like :a_chatwork_api, :get, "/rooms"
  end

  describe "#create_room", type: :api do
    subject do
      client.create_room(
        description:          description,
        icon_preset:          icon_preset,
        members_admin_ids:    members_admin_ids,
        members_member_ids:   members_member_ids,
        members_readonly_ids: members_readonly_ids,
        name:                 name,
        link:                 link,
        link_code:            link_code,
        link_need_acceptance: link_need_acceptance,
        &block
      )
    end

    let(:description)          { "group chat description" }
    let(:icon_preset)          { "meeting" }
    let(:name)                 { "Website renewal project" }
    let(:link)                 { false }
    let(:link_need_acceptance) { true }
    let(:link_code)            { nil }

    before do
      stub_chatwork_request(:post, "/rooms")
    end

    context "with String" do
      let(:members_admin_ids)    { "123,542,1001" }
      let(:members_member_ids)   { "21,344" }
      let(:members_readonly_ids) { "15,103" }

      it_behaves_like :a_chatwork_api, :post, "/rooms"
    end

    context "with Array" do
      let(:members_admin_ids)    { [123, 542, 1001] }
      let(:members_member_ids)   { [21, 344] }
      let(:members_readonly_ids) { [15, 103] }

      it_behaves_like :a_chatwork_api, :post, "/rooms"
    end
  end

  describe "#find_room", type: :api do
    subject { client.find_room(room_id: room_id, &block) }

    let(:room_id) { 123 }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}", "/rooms/{room_id}")
    end

    it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}"
  end

  describe "#update_room", type: :api do
    subject do
      client.update_room(
        room_id:     room_id,
        description: description,
        icon_preset: icon_preset,
        name:        name,
        &block
      )
    end

    let(:room_id)     { 123 }
    let(:description) { "group chat description" }
    let(:icon_preset) { "meeting" }
    let(:name)        { "Website renewal project" }

    before do
      stub_chatwork_request(:put, "/rooms/#{room_id}", "/rooms/{room_id}")
    end

    it_behaves_like :a_chatwork_api, :put, "/rooms/{room_id}"
  end

  describe "#destroy_room", type: :api do
    subject do
      client.destroy_room(
        room_id:     room_id,
        action_type: action_type,
        &block
      )
    end

    let(:room_id)     { 123 }
    let(:action_type) { "leave" }

    before do
      stub_chatwork_request(:delete, "/rooms/#{room_id}", "/rooms/{room_id}", 204)
    end

    it_behaves_like :a_chatwork_api, :delete, "/rooms/{room_id}", 204
  end
end
