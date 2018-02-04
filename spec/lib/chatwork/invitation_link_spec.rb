describe ChatWork::InvitationLink do
  describe ".get", type: :api do
    subject { ChatWork::InvitationLink.get(room_id: room_id) }

    let(:room_id) { 123 }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}/link", "/rooms/{room_id}/link")
    end

    it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}/link"
  end

  describe ".create", type: :api do
    subject do
      ChatWork::InvitationLink.create(
        room_id:         room_id,
        code:            code,
        description:     description,
        need_acceptance: need_acceptance,
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

  describe ".update", type: :api do
    subject do
      ChatWork::InvitationLink.update(
        room_id:         room_id,
        code:            code,
        description:     description,
        need_acceptance: need_acceptance,
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

  describe ".destroy", type: :api do
    subject { ChatWork::InvitationLink.destroy(room_id: room_id) }

    let(:room_id) { 123 }

    before do
      stub_chatwork_request(:delete, "/rooms/#{room_id}/link", "/rooms/{room_id}/link")
    end

    it_behaves_like :a_chatwork_api, :delete, "/rooms/{room_id}/link"
  end
end
