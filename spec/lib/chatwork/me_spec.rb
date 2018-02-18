describe ChatWork::Me do
  describe ".get", type: :api do
    subject { ChatWork::Me.get(&block) }

    before do
      stub_chatwork_request(:get, "/me")
    end

    it_behaves_like :a_chatwork_api, :get, "/me"

    context "when unauthorized" do
      before do
        stub_chatwork_request(:get, "/me", "/me", 401)
      end

      let(:block) { nil }

      it { expect { subject }.to raise_error(ChatWork::APIError, "Invalid API token") }
    end
  end
end
