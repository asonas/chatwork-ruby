describe ChatWork::Client::MyTaskMethods do
  describe "#get_my_tasks", type: :api do
    subject do
      client.get_my_tasks(
        assigned_by_account_id: assigned_by_account_id,
        status:                 status,
        &block
      )
    end

    let(:assigned_by_account_id) { 78 }
    let(:status)                 { "done" }

    before do
      stub_chatwork_request(:get, "/my/tasks")
    end

    it_behaves_like :a_chatwork_api, :get, "/my/tasks"
  end
end
