require "chatwork/version"

module ChatWork
  autoload :BaseClient,         "chatwork/base_client"
  autoload :APIConnectionError, "chatwork/chatwork_error"
  autoload :APIError,           "chatwork/chatwork_error"
  autoload :ChatWorkError,      "chatwork/chatwork_error"
  autoload :Client,             "chatwork/client"
  autoload :Contacts,           "chatwork/contacts"
  autoload :EntityMethods,      "chatwork/entity_methods"
  autoload :Me,                 "chatwork/me"
  autoload :Member,             "chatwork/member"
  autoload :Message,            "chatwork/message"
  autoload :MyTask,             "chatwork/my_task"
  autoload :OAuthClient,        "chatwork/oauth_client"
  autoload :Room,               "chatwork/room"
  autoload :Task,               "chatwork/task"
  autoload :Token,              "chatwork/token"

  @api_base = "https://api.chatwork.com/"
  @oauth_api_base = "https://oauth.chatwork.com/"
  @api_version = "/v2"
  @api_key = nil
  @access_token = nil
  @client_id = nil
  @client_secret = nil

  class << self
    attr_reader :api_base

    attr_reader :oauth_api_base

    attr_reader :api_version

    def client
      @client ||= Client.new(api_key, access_token, api_base, api_version)
    end

    def oauth_client
      @oauth_client ||= OAuthClient.new(client_id, client_secret, oauth_api_base)
    end

    def api_base=(new_value)
      @api_base = new_value
      @client = nil
    end

    def oauth_api_base=(new_value)
      @oauth_api_base = new_value
      @oauth_client = nil
    end

    def api_key=(new_value)
      @api_key = new_value
      @access_token = nil
      @client = nil
    end

    def access_token=(new_value)
      @api_key = nil
      @access_token = new_value
      @client = nil
    end

    def client_id=(new_value)
      @client_id = new_value
      @oauth_client = nil
    end

    def client_secret=(new_value)
      @client_secret = new_value
      @oauth_client = nil
    end

    def api_key
      @api_key || ENV["CHATWORK_API_TOKEN"]
    end

    def access_token
      @access_token || ENV["CHATWORK_ACCESS_TOKEN"]
    end

    def client_id
      @client_id || ENV["CHATWORK_CLIENT_ID"]
    end

    def client_secret
      @client_secret || ENV["CHATWORK_CLIENT_SECRET"]
    end
  end
end
