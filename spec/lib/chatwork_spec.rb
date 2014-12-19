require 'spec_helper'
require 'chatwork'

describe ChatWork do
  describe '#client' do
    subject { super().client }
    it { should be_a(ChatWork::Client) }
  end

  describe '#api_base' do
    subject { super().api_base }
    it { should eq('https://api.chatwork.com/') }
  end
  describe '#api_base=' do
    before { ChatWork.api_base = 'https://test.example.com/' }

    describe '#api_base' do
      subject { super().api_base }
      it { should eq('https://test.example.com/') }
    end

    describe '#api_base' do
      subject { super().api_base }
      it { should eq('https://test.example.com/') }
    end
  end

  describe '#api_key' do
    subject { super().api_key }
    it { should be_nil }
  end
end
