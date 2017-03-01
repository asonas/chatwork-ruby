require 'faraday'

RSpec.shared_context "shared stubs" do
  let(:api_key) { 'api_key' }
  let(:api_version) { ChatWork.api_version }
  let(:api_base) { ChatWork.api_base }

  let(:test_adapter) {
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get("#{api_version}/rooms/1/members") { [200,
                                        {'X-RateLimit-Limit': '100', 'X-RateLimit-Remaining': '44'},
                                        [{ "account_id"=> 123,  "name"=> "John Smith"}].to_json ]
      }
    end
  }

  let(:faraday) {
    default_header = {
      'X-ChatWorkToken': api_key,
      'User-Agent': "ChatWork#{api_version} RubyBinding/#{ChatWork::VERSION}"
    }
    Faraday.new("#{api_base}#{api_version}", headers: default_header) do |builder|
      builder.request :url_encoded
      builder.adapter Faraday.default_adapter
      builder.adapter :test, test_adapter
    end
  }

  let(:client) {
    allow(Faraday).to receive(:new).and_return(faraday)
    client = ChatWork::Client.new(api_key, api_base, api_version)
    client
  }

  before(:each) do
    allow(ChatWork).to receive(:client).and_return(client)
  end
end
