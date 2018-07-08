module ChatWork
  module Message
    # Get all messages associated with the specified chat (returns up to 100 entries).
    #
    # If the parameter is not set, it returns the next 100 entries from previous call.
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id-messages
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param force   [Boolean, Integer] Flag which forces to get 100 newest entries regardless of previous calls.
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
    #       "message_id": "5",
    #       "account": {
    #         "account_id": 123,
    #         "name": "Bob",
    #         "avatar_image_url": "https://example.com/ico_avatar.png"
    #       },
    #       "body": "Hello Chatwork!",
    #       "send_time": 1384242850,
    #       "update_time": 0
    #     }
    #   ]
    def self.get(room_id:, force: nil, &block)
      ChatWork.client.get_messages(room_id: room_id, force: force, &block)
    end

    # Add new message to the chat
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#POST-rooms-room_id-messages
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id     [Integer]
    # @param body        [String] message body
    # @param self_unread [Boolean] Whether to add the added message as unread by looking at it from myself
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "message_id": "1234"
    #   }
    def self.create(room_id:, body:, self_unread: false, &block)
      ChatWork.client.create_message(room_id: room_id, body: body, self_unread: self_unread, &block)
    end

    # Mark messages as read
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#PUT-rooms-room_id-messages-read
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param message_id [String]
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "unread_num": 461,
    #     "mention_num": 0
    #   }
    def self.read(room_id:, message_id: nil, &block)
      ChatWork.client.read_message(room_id: room_id, message_id: message_id, &block)
    end

    # Mark messages as unread
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#PUT-rooms-room_id-messages-unread
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param message_id [String]
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "unread_num": 3,
    #     "mention_num": 0
    #   }
    def self.unread(room_id:, message_id:, &block)
      ChatWork.client.unread_message(room_id: room_id, message_id: message_id, &block)
    end

    # Get information about the specified message
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id-messages-message_id
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param message_id [String]
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "message_id": "5",
    #     "account": {
    #       "account_id": 123,
    #       "name": "Bob",
    #       "avatar_image_url": "https://example.com/ico_avatar.png"
    #     },
    #     "body": "Hello Chatwork!",
    #     "send_time": 1384242850,
    #     "update_time": 0
    #   }
    def self.find(room_id:, message_id:, &block)
      ChatWork.client.find_message(room_id: room_id, message_id: message_id, &block)
    end

    # Update the specified message
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#PUT-rooms-room_id-messages-message_id
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param message_id [String]
    # @param body [String] message body
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "message_id": "1234"
    #   }
    def self.update(room_id:, message_id:, body:, &block)
      ChatWork.client.update_message(room_id: room_id, message_id: message_id, body: body, &block)
    end

    # Destroy the specified message
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#PUT-rooms-room_id-messages-message_id
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param message_id [String]
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "message_id": "1234"
    #   }
    def self.destroy(room_id:, message_id:, &block)
      ChatWork.client.destroy_message(room_id: room_id, message_id: message_id, &block)
    end
  end
end
