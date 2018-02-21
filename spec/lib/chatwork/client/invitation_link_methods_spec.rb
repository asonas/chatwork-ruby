describe ChatWork::Client::InvitationLinkMethods do
  describe "#get_invitation_link", type: :api do
    subject { client.get_invitation_link(room_id: room_id, &block) }

    let(:room_id) { 123 }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}/link", "/rooms/{room_id}/link")
    end

    it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}/link"
  end

  describe "#create_invitation_link", type: :api do
    subject do
      client.create_invitation_link(
        room_id:         room_id,
        code:            code,
        description:     description,
        need_acceptance: need_acceptance,
        &block
      )
    end

    let(:room_id)         { 123 }
    let(:code)            { "unique-link-name" }
    let(:description)     { "This is a public room for topic A." }
    let(:need_acceptance) { true }

    before do
      stub_chatwork_request(:post, "/rooms/#{room_id}/link", "/rooms/{room_id}/link")
    end

    it_behaves_like :a_chatwork_api, :post, "/rooms/{room_id}/link"
  end

  describe "#update_invitation_link", type: :api do
    subject do
      client.update_invitation_link(
        room_id:         room_id,
        code:            code,
        description:     description,
        need_acceptance: need_acceptance,
        &block
      )
    end

    let(:room_id)         { 123 }
    let(:code)            { "another_link_name" }
    let(:description)     { "Public room for everybody" }
    let(:need_acceptance) { false }

    before do
      stub_chatwork_request(:put, "/rooms/#{room_id}/link", "/rooms/{room_id}/link")
    end

    it_behaves_like :a_chatwork_api, :put, "/rooms/{room_id}/link"
  end

  describe "#destroy_invitation_link", type: :api do
    subject { client.destroy_invitation_link(room_id: room_id, &block) }

    let(:room_id) { 123 }

    before do
      stub_chatwork_request(:delete, "/rooms/#{room_id}/link", "/rooms/{room_id}/link")
    end

    it_behaves_like :a_chatwork_api, :delete, "/rooms/{room_id}/link"
  end
end
