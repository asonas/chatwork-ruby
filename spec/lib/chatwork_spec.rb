require 'spec_helper'
require 'chatwork'

describe ChatWork do
  its(:client) { should be_a(ChatWork::Client) }
  its(:api_base) { should eq('https://api.chatwork.com/') }
  describe '#api_base=' do
    before { subject.api_base = 'https://test.example.com/' }
    its(:api_base) { should eq('https://test.example.com/') }
    its(:api_base) { should eq('https://test.example.com/') }
  end
  its(:api_key) { should be_nil }
end
