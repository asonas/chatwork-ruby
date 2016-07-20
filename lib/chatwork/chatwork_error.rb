require 'json'
module ChatWork
  class ChatWorkError < StandardError

    def self.from_response(status, body)
      # HTTP status 204 don't have body.
      return APIError.new(status, "") if status == 204

      hash =
        begin
          JSON.load(body)
        rescue JSON::ParserError => e
          return ChatWork::APIConnectionError.new("Response JSON is broken. #{e.message}: #{body}", e)
        end
      unless hash['errors']
        return APIConnectionError.new("Invalid response #{body}")
      end

      APIError.new(status, hash['errors'])
    end

    attr_reader :status
    attr_reader :error_response

    def initialize(message, status = nil, error_response = nil)
      @status, @error_response = status, error_response
      super(message)
    end
  end

  class APIConnectionError < ChatWorkError
    def self.faraday_error(e)
      new("Connection with ChatWork API server failed. #{e.message}", e)
    end

    attr_reader :original_error

    def initialize(message, original_error)
      @original_error = original_error
      super(message)
    end
  end

  class APIError < ChatWorkError
    attr_reader :errors

    def initialize(status, error_response)
      @errors = error_response
      super(error_response[0], status, error_response)
    end
  end
end
