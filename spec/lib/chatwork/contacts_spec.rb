describe ChatWork::Contacts do
  describe ".get", type: :api do
    subject { ChatWork::Contacts.get(&block) }

    before do
      stub_chatwork_request(:get, "/contacts")
    end

    it_behaves_like :a_chatwork_api, :get, "/contacts"
  end
end
