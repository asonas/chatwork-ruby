RSpec.describe RamlParser do
  describe ".find_resource" do
    subject { RamlParser.find_resource(verb, path) }

    let(:verb)   { :get }
    let(:path)   { "/rooms/{room_id}/members" }

    its(["description"]) { should eq "チャットのメンバー一覧を取得" }
    its(["is"])          { should eq ["room_member_list_response", "unauthorized_response"] }
  end

  describe ".find_response_example" do
    subject { RamlParser.find_response_example(verb, path, status) }

    context "contains in responses" do
      let(:verb)   { :put }
      let(:path)   { "/rooms/{room_id}/members" }
      let(:status) { 200 }

      let(:expected) do
        {
          "admin" => [123, 542, 1001],
          "member" => [10, 103],
          "readonly" => [6, 11],
        }
      end

      it { should eq expected }
    end

    context "contains in is" do
      let(:verb)   { :get }
      let(:path)   { "/rooms/{room_id}/messages" }
      let(:status) { 200 }

      let(:expected) do
        [
          {
            "message_id" => "5",
            "account" => {
              "account_id" => 123,
              "name" => "Bob",
              "avatar_image_url" => "https://example.com/ico_avatar.png",
            },
            "body" => "Hello Chatwork!",
            "send_time" => 1_384_242_850,
            "update_time" => 0,
          },
        ]
      end

      it { should eq expected }
    end
  end

  describe ".find_trait" do
    subject { RamlParser.find_trait(trait_name) }

    let(:trait_name) { "room_icon" }

    it "can get trait" do
      expect(subject["queryParameters"]).not_to eq nil
      expect(subject["queryParameters"]["icon_preset"]).not_to eq nil
      expect(subject["queryParameters"]["icon_preset"]["displayName"]).to eq "アイコン種類"
    end
  end

  describe ".find_query_parameter_example" do
    subject { RamlParser.find_query_parameter_example(verb, path) }

    let(:verb) { :put }
    let(:path) { "/rooms/{room_id}" }

    its(:count)          { should eq 3 }
    its(["name"])        { should eq "Website renewal project" }
    its(["description"]) { should eq "group chat description" }
    its(["icon_preset"]) { should eq "meeting" }
  end
end
