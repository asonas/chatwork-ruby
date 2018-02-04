describe ChatWork::Room do
  describe ".get", type: :api do
    subject { ChatWork::Room.get }

    let(:room_id) { 123 }

    before do
      stub_chatwork_request(:get, "/rooms")
    end

    it_behaves_like :a_chatwork_api, :get, "/rooms"
  end

  describe ".create", type: :api do
    subject do
      ChatWork::Room.create(
        description:          description,
        icon_preset:          icon_preset,
        members_admin_ids:    members_admin_ids,
        members_member_ids:   members_member_ids,
        members_readonly_ids: members_readonly_ids,
        name:                 name,
        link:                 link,
        link_code:            link_code,
        link_need_acceptance: link_need_acceptance,
      )
    end

    let(:description) { "group chat description" }
    let(:icon_preset) { "meeting" }
    let(:name)        { "Website renewal project" }
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

  describe ".find", type: :api do
    subject { ChatWork::Room.find(room_id: room_id) }

    let(:room_id) { 123 }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}", "/rooms/{room_id}")
    end

    it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}"
  end

  describe ".update", type: :api do
    subject do
      ChatWork::Room.update(
        room_id:     room_id,
        description: description,
        icon_preset: icon_preset,
        name:        name,
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

  describe ".destroy", type: :api do
    subject do
      ChatWork::Room.destroy(
        room_id:     room_id,
        action_type: action_type,
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
