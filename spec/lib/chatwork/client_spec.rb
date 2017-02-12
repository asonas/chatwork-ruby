require 'spec_helper'
require 'chatwork'

describe ChatWork::Client do
  API_KEY = 'api_key'
  API_VERSION = ChatWork.api_version
  API_BASE = ChatWork.api_base

  let(:test_adapter) {
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get("#{API_VERSION}/rooms/1/members") { [200,
                                        {'X-RateLimit-Limit': '100', 'X-RateLimit-Remaining': '44'},
                                        [{ "account_id"=> 123,  "name"=> "John Smith"}].to_json ]
      }
    end
  }

  let(:faraday) {
    default_header = {
      'X-ChatWorkToken': API_KEY,
      'User-Agent': "ChatWork#{API_VERSION} RubyBinding/#{ChatWork::VERSION}"
    }
    Faraday.new("#{API_BASE}#{API_VERSION}", headers: default_header) do |builder|
      builder.request :url_encoded
      builder.adapter Faraday.default_adapter
      builder.adapter :test, test_adapter
    end
  }

  let(:client) {
    allow(Faraday).to receive(:new).and_return(faraday)
    client = ChatWork::Client.new(API_KEY, API_BASE, API_VERSION)
    client
  }

  before(:each) do
    allow(ChatWork).to receive(:client).and_return(client)
  end

  describe 'get room members' do
    it 'should work' do
      expect(ChatWork::Member.get(room_id: 1)).to eq([{ "account_id"=> 123,  "name"=> "John Smith"}])
    end

    it 'should work with block' do
      ChatWork::Member.get(room_id: 1) do |body, headers|
        expect(body).to eq([{ "account_id"=> 123,  "name"=> "John Smith"}])
        expect(headers).to eq({'X-ratelimit-limit'=> '100', 'X-ratelimit-remaining'=> '44'})
      end
    end
  end
end
