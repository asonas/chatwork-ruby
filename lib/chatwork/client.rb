require 'faraday'
require 'json'

module ChatWork
  class Client
    def initialize(api_key, api_base, api_version)
      default_header = {
        'X-ChatWorkToken' => api_key,
        'User-Agent' => 'ChatWork#{api_version} RubyBinding/#{ChatWork::VERSION}'
      }

      @conn = Faraday.new(api_base, headers: default_header) do |builder|
        builder.request :url_encoded
        builder.adapter Faraday.default_adapter
      end
      @api_version = api_version
    end

    def handle_response(response)
      case response.status
      when 200..299
        begin
          JSON.parse(response.body)
        rescue JSON::ParserError => e
          raise ChatWork::APIConnectionError.new("Response JSON is broken. #{e.message}: #{response.body}")
        end
      else
        ChatWork::ChatWorkError.from_response(response.status, response.body)
      end
    end

    Faraday::Connection::METHODS.each do |method|
      define_method(method) do |url, *args|
        begin
          response = @conn.__send__(method, @api_version + url, *args)
        rescue Faraday::Error::ClientError => e
          raise ChatWork::APIConnectionError.faraday_error(e)
        end
        handle_response(response)
      end
    end
  end
end
