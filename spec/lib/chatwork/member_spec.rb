require 'spec_helper'
require 'chatwork'
require_relative '../../shared_stubs.rb'

describe ChatWork::Member do
  include_context 'shared stubs'
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
