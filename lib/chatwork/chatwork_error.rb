require "json"
module ChatWork
  class ChatWorkError < StandardError
    def self.from_response(status, body, headers)
      hash =
        begin
          JSON.parse(body)
        rescue JSON::ParserError => e
          return ChatWork::APIConnectionError.new("Response JSON is broken. #{e.message}: #{body}", e)
        end
      unless hash["errors"]
        return APIConnectionError.new("Invalid response #{body}")
      end

      if headers.has_key?("WWW-Authenticate")
        return AuthenticateError.new(headers["WWW-Authenticate"], status, hash["errors"])
      end

      APIError.new(status, hash["errors"])
    end

    attr_reader :status
    attr_reader :error_response

    def initialize(message, status = nil, error_response = nil)
      @status = status
      @error_response = error_response
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

  class AuthenticateError < ChatWorkError
    attr_reader :error, :error_description

    def initialize(message, status, error_response)
      message =~ /error="([^\"]+)"/
      @error = Regexp.last_match(1)

      message =~ /error_description="([^\"]+)"/
      @error_description = Regexp.last_match(1)

      super(message, status, error_response)
    end
  end
end
