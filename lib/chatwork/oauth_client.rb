require 'base64'

module ChatWork
  class OAuthClient < BaseClient
    def initialize(client_id, client_secret, oauth_api_base)
      signature = Base64.encode64("#{client_id}:#{client_secret}").gsub("\n", "")
      super(oauth_api_base, "", { 'Authorization' => "Basic #{signature}" })
    end
  end
end
