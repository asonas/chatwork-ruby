describe ChatWork::Task do
  describe ".get", type: :api do
    subject do
      ChatWork::Task.get(
        room_id:                room_id,
        account_id:             account_id,
        assigned_by_account_id: assigned_by_account_id,
        status:                 status,
        &block
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
        room_id:    room_id,
        body:       body,
        to_ids:     to_ids,
        limit:      limit,
        limit_type: limit_type,
        &block
      )
    end

    let(:room_id)    { 123 }
    let(:body)       { "Buy milk" }
    let(:to_ids)     { "1,3,6" }
    let(:limit)      { "1385996399" }
    let(:limit_type) { "time" }

    before do
      stub_chatwork_request(:post, "/rooms/#{room_id}/tasks", "/rooms/{room_id}/tasks")
    end

    context "when to_ids and limit are String" do
      it_behaves_like :a_chatwork_api, :post, "/rooms/{room_id}/tasks"
    end

    context "when to_ids is Array" do
      let(:to_ids) { [1, 3, 6] }

      it_behaves_like :a_chatwork_api, :post, "/rooms/{room_id}/tasks"
    end

    context "when limit is Time" do
      let(:limit) { Time.at(1_385_996_399) }

      it_behaves_like :a_chatwork_api, :post, "/rooms/{room_id}/tasks"
    end
  end

  describe ".find", type: :api do
    subject do
      ChatWork::Task.find(
        room_id: room_id,
        task_id: task_id,
        &block
      )
    end

    let(:room_id) { 123 }
    let(:task_id) { 3 }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}/tasks/#{task_id}", "/rooms/{room_id}/tasks/{task_id}")
    end

    it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}/tasks/{task_id}"
  end

  describe ".update_status", type: :api do
    subject do
      ChatWork::Task.update_status(
        room_id: room_id,
        task_id: task_id,
        body:    body,
        &block
      )
    end

    let(:room_id) { 123 }
    let(:task_id) { 3 }
    let(:body)    { "done" }

    before do
      stub_chatwork_request(:put, "/rooms/#{room_id}/tasks/#{task_id}/status", "/rooms/{room_id}/tasks/{task_id}/status")
    end

    it_behaves_like :a_chatwork_api, :put, "/rooms/{room_id}/tasks/{task_id}/status"
  end
end
