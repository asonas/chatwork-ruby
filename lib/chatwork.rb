require "chatwork/version"

module ChatWork
  autoload(:BaseClient, 'chatwork/base_client')
  autoload(:Client, 'chatwork/client')
  autoload(:Operations, 'chatwork/operations')
  autoload(:ChatWorkError, 'chatwork/chatwork_error')
  autoload(:APIConnectionError, 'chatwork/chatwork_error')
  autoload(:APIError, 'chatwork/chatwork_error')
  autoload(:Room, 'chatwork/room')
  autoload(:Entity, 'chatwork/entity')
  autoload(:Message, 'chatwork/message')
  autoload(:Me, 'chatwork/me')
  autoload(:MyTask, 'chatwork/my_task')
  autoload(:Task, 'chatwork/task')
  autoload(:Member, 'chatwork/member')
  autoload(:Contacts, 'chatwork/contacts')

  @api_base = 'https://api.chatwork.com/'
  @api_version = '/v2'
  @api_key = nil
  @access_token = nil

  class << self
    def client
      @client ||= Client.new(api_key, access_token, api_base, api_version)
    end

    def api_base=(new_value)
      @api_base = new_value
      @client = nil
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

    def api_base
      @api_base
    end

    def api_key
      @api_key || ENV['CHATWORK_API_TOKEN']
    end

    def access_token
      @access_token || ENV['CHATWORK_ACCESS_TOKEN']
    end

    def api_version
      @api_version
    end
  end
end
