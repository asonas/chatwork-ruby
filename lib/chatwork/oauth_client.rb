require "base64"

module ChatWork
  class OAuthClient < BaseClient
    require "chatwork/oauth_client/token_methods"

    include TokenMethods

    # @param client_id     [String]
    # @param client_secret [String]
    # @param api_base      [String] default is {ChatWork.oauth_api_base}
    def initialize(client_id:, client_secret:, api_base: nil)
      api_base ||= ChatWork.oauth_api_base
      signature = Base64.encode64("#{client_id}:#{client_secret}").delete("\n")
      super(api_base: api_base, header: { "Authorization" => "Basic #{signature}" })
    end
  end
end
