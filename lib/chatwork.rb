require "chatwork/version"
require "hashie"
require "faraday"

module ChatWork
  autoload :BaseClient,         "chatwork/base_client"
  autoload :APIConnectionError, "chatwork/chatwork_error"
  autoload :APIError,           "chatwork/chatwork_error"
  autoload :AuthenticateError,  "chatwork/chatwork_error"
  autoload :ChatWorkError,      "chatwork/chatwork_error"
  autoload :Client,             "chatwork/client"
  autoload :Contacts,           "chatwork/contacts"
  autoload :Converter,          "chatwork/converter"
  autoload :File,               "chatwork/file"
  autoload :IncomingRequest,    "chatwork/incoming_request"
  autoload :InvitationLink,     "chatwork/invitation_link"
  autoload :Me,                 "chatwork/me"
  autoload :Member,             "chatwork/member"
  autoload :Message,            "chatwork/message"
  autoload :Multipart,          "chatwork/multipart"
  autoload :MyStatus,           "chatwork/my_status"
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

  Faraday::Request.register_middleware(
    chatwork_multipart: -> { ChatWork::Multipart },
  )

  class << self
    # @!attribute [r] api_base
    #  @return [String]
    attr_reader :api_base

    # @!attribute [r] oauth_api_base
    #  @return [String]
    attr_reader :oauth_api_base

    # @!attribute [r] api_version
    #  @return [String]
    attr_reader :api_version

    # @return [ChatWork::Client]
    def client
      @client ||= Client.new(api_key: api_key, access_token: access_token)
    end

    # @return [ChatWork::OAuthClient]
    def oauth_client
      @oauth_client ||= OAuthClient.new(client_id: client_id, client_secret: client_secret)
    end

    # @param new_value [String]
    def api_base=(new_value)
      @api_base = new_value
      @client = nil
    end

    # @param new_value [String]
    def api_version=(new_value)
      @api_version = new_value
      @client = nil
    end

    # @param new_value [String]
    def oauth_api_base=(new_value)
      @oauth_api_base = new_value
      @oauth_client = nil
    end

    # @param new_value [String]
    def api_key=(new_value)
      @api_key = new_value
      @access_token = nil
      @client = nil
    end

    # @param new_value [String]
    def access_token=(new_value)
      @api_key = nil
      @access_token = new_value
      @client = nil
    end

    # @param new_value [String]
    def client_id=(new_value)
      @client_id = new_value
      @oauth_client = nil
    end

    # @param new_value [String]
    def client_secret=(new_value)
      @client_secret = new_value
      @oauth_client = nil
    end

    # @return [String]
    #
    # @note if {ChatWork.api_key} is not defined, returns `ENV["CHATWORK_API_TOKEN"]`
    def api_key
      @api_key || ENV["CHATWORK_API_TOKEN"]
    end

    # @return [String]
    #
    # @note if {ChatWork.access_token} is not defined, returns `ENV["CHATWORK_ACCESS_TOKEN"]`
    def access_token
      @access_token || ENV["CHATWORK_ACCESS_TOKEN"]
    end

    # @return [String]
    #
    # @note if {ChatWork.client_id} is not defined, returns `ENV["CHATWORK_CLIENT_ID"]`
    def client_id
      @client_id || ENV["CHATWORK_CLIENT_ID"]
    end

    # @return [String]
    #
    # @note if {ChatWork.client_secret} is not defined, returns `ENV["CHATWORK_CLIENT_SECRET"]`
    def client_secret
      @client_secret || ENV["CHATWORK_CLIENT_SECRET"]
    end
  end
end
