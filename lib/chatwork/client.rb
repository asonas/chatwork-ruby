module ChatWork
  class Client < BaseClient
    def initialize(api_key, access_token, api_base, api_version)
      if api_key
        super(api_base, api_version, { 'X-ChatWorkToken' => api_key })
      elsif access_token
        super(api_base, api_version, { 'Authorization' => "Bearer #{access_token}" })
      else
        raise "Either api_key or access_token is required"
      end
    end
  end
end
