describe ChatWork::Task do
  describe ".get", type: :api do
    subject do
      ChatWork::Task.get(
        room_id:                room_id,
        account_id:             account_id,
        assigned_by_account_id: assigned_by_account_id,
        status:                 status,
      )
    end

    let(:room_id)                { 123 }
    let(:account_id)             { 101 }
    let(:assigned_by_account_id) { 78 }
    let(:status)                 { "done" }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}/tasks", "/rooms/{room_id}/tasks")
    end

    it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}/tasks"
  end

  describe ".create", type: :api do
    subject do
      ChatWork::Task.create(
        room_id: room_id,
        body:    body,
        to_ids:  to_ids,
        limit:   limit,
      )
    end

    let(:room_id) { 123 }
    let(:body)    { "Buy milk" }
    let(:to_ids)  { "1,3,6" }
    let(:limit)   { "1385996399" }

    before do
      stub_chatwork_request(:post, "/rooms/#{room_id}/tasks", "/rooms/{room_id}/tasks")
    end

    it_behaves_like :a_chatwork_api, :post, "/rooms/{room_id}/tasks"
  end
end
