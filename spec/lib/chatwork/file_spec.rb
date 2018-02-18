describe ChatWork::File do
  describe ".get", type: :api do
    subject { ChatWork::File.get(room_id: room_id, account_id: account_id, &block) }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}/files", "/rooms/{room_id}/files")
    end

    let(:room_id)    { 123 }
    let(:account_id) { 101 }

    it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}/files"
  end

  describe ".find", type: :api do
    subject { ChatWork::File.find(room_id: room_id, file_id: file_id, create_download_url: create_download_url, &block) }

    before do
      stub_chatwork_request(:get, "/rooms/#{room_id}/files/#{file_id}", "/rooms/{room_id}/files/{file_id}")
    end

    let(:room_id) { 123 }
    let(:file_id) { 101 }

    context "when force is Integer" do
      let(:create_download_url) { 1 }

      it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}/files/{file_id}"
    end

    context "when force is boolean" do
      let(:create_download_url) { true }

      it_behaves_like :a_chatwork_api, :get, "/rooms/{room_id}/files/{file_id}"
    end
  end
end
