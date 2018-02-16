describe ChatWork::Client::ContactsMethods do
  describe "#get_contacts", type: :api do
    subject { client.get_contacts(&block) }

    before do
      stub_chatwork_request(:get, "/contacts")
    end

    it_behaves_like :a_chatwork_api, :get, "/contacts"
  end
end
