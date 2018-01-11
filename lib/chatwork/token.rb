module ChatWork
  module Token
    # refresh access_token with refresh_token
    #
    # @param refresh_token [String]
    # @param scope [Array<String>]
    #
    # @return [Hash]
    # @example response
    #   {
    #     "access_token" => "new_access_token",
    #     "token_type" => "Bearer",
    #     "expires_in" => "1800",
    #     "refresh_token" => "refresh_token",
    #     "scope" => "users.all:read rooms.all:read_write contacts.all:read_write",
    #   }
    #   ["access_token", "token_type", "expires_in", "refresh_token", "scope"]
    def self.refresh_access_token(refresh_token, scope = [])
      params = {
        grant_type:    "refresh_token",
        refresh_token: refresh_token,
      }
      params[:scope] = scope.join(" ") unless scope.empty?

      response = ChatWork.oauth_client.post("/token", params)
      raise response if response.is_a?(Exception)
      response
    end
  end
end
