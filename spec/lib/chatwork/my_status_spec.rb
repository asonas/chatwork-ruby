describe ChatWork::MyStatus do
  describe ".get", type: :api do
    subject do
      ChatWork::MyStatus.get(&block)
    end

    before do
      stub_chatwork_request(:get, "/my/status")
    end

    it_behaves_like :a_chatwork_api, :get, "/my/status"
  end
end
