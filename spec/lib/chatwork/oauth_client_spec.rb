describe ChatWork::OAuthClient do
  describe '#initialize' do
    subject { ChatWork::OAuthClient.new(client_id, client_secret, api_base) }

    let(:client_id)     { 'client_id' }
    let(:client_secret) { 'client_secret' }
    let(:api_base)      { 'https://token.chatwork.com/' }
    let(:signature)     { 'Y2xpZW50X2lkOmNsaWVudF9zZWNyZXQ=' }

    it 'client has Authorization header' do
      connection = subject.instance_variable_get(:@conn)

      expect(connection.headers['Authorization']).to eq "Basic #{signature}"
    end
  end
end
