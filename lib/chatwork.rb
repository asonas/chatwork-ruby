require "chatwork/version"

module ChatWork
  autoload(:Client, 'chatwork/client')

  @api_base = 'https://api.chatwork.com/'
  @api_version = '/v1'
  @api_key = nil

  class << self
    def client
      @client ||= Cluent.new(@api_key, @api_base, @api_version)
    end

    def api_base=(new_value)
      @api_base = new_value
      @client = nil
    end

    def api_key=(new_value)
      @api_key = new_value
      @client = nil
    end

    def api_base
      @api_base
    end

    def api_key
      @api_key
    end
  end
end
