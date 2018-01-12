module ChatWork
  class ChatWorkError < StandardError
    def self.from_response(status, body, headers)
      if headers.has_key?("WWW-Authenticate")
        return AuthenticateError.from_www_authenticate(
          www_authenticate: headers["WWW-Authenticate"],
          status:           status,
          error_response:   body["errors"],
        )
      end

      return APIError.new(status, body["errors"]) if body["errors"]

      if body["error"]
        message = [body["error"], body["error_description"]].compact.join(" ")
        return AuthenticateError.new(message, status, body, body["error"], body["error_description"])
      end

      APIConnectionError.new("Invalid response #{body.to_hash} (status: #{status})")
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

    def initialize(message, original_error = nil)
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

    def initialize(message, status, error_response, error, error_description)
      @error = error
      @error_description = error_description

      super(message, status, error_response)
    end

    def self.from_www_authenticate(www_authenticate:, status:, error_response:)
      www_authenticate =~ /error="([^\"]+)"/
      error = Regexp.last_match(1)

      www_authenticate =~ /error_description="([^\"]+)"/
      error_description = Regexp.last_match(1)

      AuthenticateError.new(
        www_authenticate,
        status,
        error_response,
        error,
        error_description,
      )
    end
  end
end
