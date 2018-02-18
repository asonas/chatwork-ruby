module ChatWork
  module IncomingRequest
    extend EntityMethods

    # You can get the list of contact approval request you received
    #
    # (*This method returns up to 100 entries. We are planning to implement pagination to support larger number of data retrieval)
    #
    # @see http://developer.chatwork.com/ja/endpoint_incoming_requests.html#GET-incoming_requests
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Array<Hashie::Mash>] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Array<Hashie::Mash>]
    #
    # @example response format
    #   [
    #     {
    #       "request_id": 123,
    #       "account_id": 363,
    #       "message": "hogehoge",
    #       "name": "John Smith",
    #       "chatwork_id": "tarochatworkid",
    #       "organization_id": 101,
    #       "organization_name": "Hello Company",
    #       "department": "Marketing",
    #       "avatar_image_url": "https://example.com/abc.png"
    #     }
    #   ]
    def self.get(&block)
      _get("/incoming_requests", &block)
    end

    # You can approve a contact approval request you received
    #
    # @see http://developer.chatwork.com/ja/endpoint_incoming_requests.html#PUT-incoming_requests-request_id
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param request_id [Integer]
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "account_id": 363,
    #     "room_id": 1234,
    #     "name": "John Smith",
    #     "chatwork_id": "tarochatworkid",
    #     "organization_id": 101,
    #     "organization_name": "Hello Company",
    #     "department": "Marketing",
    #     "avatar_image_url": "https://example.com/abc.png"
    #   }
    def self.update(request_id:, &block)
      _put("/incoming_requests/#{request_id}", &block)
    end

    # You can decline a contact approval request you received
    #
    # @see http://developer.chatwork.com/ja/endpoint_incoming_requests.html#DELETE-incoming_requests-request_id
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param request_id [Integer]
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    def self.destroy(request_id:, &block)
      _delete("/incoming_requests/#{request_id}", &block)
    end

    class << self
      alias_method :approve, :update
      alias_method :decline, :destroy
    end
  end
end
