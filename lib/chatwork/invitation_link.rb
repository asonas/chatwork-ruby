module ChatWork
  module InvitationLink
    extend EntityMethods

    # Get invitation link
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id-link
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "public": true,
    #     "url": "https://example.chatwork.com/g/randomcode42",
    #     "need_acceptance": true,
    #     "description": "Link description text"
    #   }
    def self.get(room_id:, &block)
      _get("/rooms/#{room_id}/link", &block)
    end

    # Create invitation link
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#POST-rooms-room_id-link
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param code [String] link path (default. random string)
    # @param description [String] description of link page
    # @param need_acceptance [Boolean] Approval necessity. Whether participation requires administrator approval.
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "public": true,
    #     "url": "https://example.chatwork.com/g/unique-link-name",
    #     "need_acceptance": true,
    #     "description": "This is a public room for topic A."
    #   }
    def self.create(room_id:, code: nil, description: nil, need_acceptance: nil, &block)
      params = {
        code:            code,
        description:     description,
        need_acceptance: boolean_to_integer(need_acceptance),
      }
      _post("/rooms/#{room_id}/link", params, &block)
    end

    # Update invitation link
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#PUT-rooms-room_id-link
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param code [String] link path (default. random string)
    # @param description [String] description of link page
    # @param need_acceptance [Boolean] Approval necessity. Whether participation requires administrator approval.
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "public": true,
    #     "url": "https://example.chatwork.com/g/another_link_name",
    #     "need_acceptance": false,
    #     "description": "Public room for everybody"
    #   }
    def self.update(room_id:, code: nil, description: nil, need_acceptance: nil, &block)
      params = {
        code:            code,
        description:     description,
        need_acceptance: boolean_to_integer(need_acceptance),
      }
      _put("/rooms/#{room_id}/link", params, &block)
    end

    # Delete invitation link
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#DELETE-rooms-room_id-link
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "public": false
    #   }
    def self.destroy(room_id:, &block)
      _delete("/rooms/#{room_id}/link", &block)
    end
  end
end
