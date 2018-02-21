module ChatWork::Client::MessageMethods
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
  def get_messages(room_id:, force: nil, &block)
    get("/rooms/#{room_id}/messages", force: boolean_to_integer(force), &block)
  end

  # Add new message to the chat
  #
  # @see http://developer.chatwork.com/ja/endpoint_rooms.html#POST-rooms-room_id-messages
  # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
  #
  # @param room_id [Integer]
  # @param body    [String] message body
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
  def create_message(room_id:, body:, &block)
    post("/rooms/#{room_id}/messages", body: body, &block)
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
  def read_message(room_id:, message_id: nil, &block)
    put("/rooms/#{room_id}/messages/read", message_id: message_id, &block)
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
  def unread_message(room_id:, message_id:, &block)
    put("/rooms/#{room_id}/messages/unread", message_id: message_id, &block)
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
  def find_message(room_id:, message_id:, &block)
    get("/rooms/#{room_id}/messages/#{message_id}", &block)
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
  def update_message(room_id:, message_id:, body:, &block)
    put("/rooms/#{room_id}/messages/#{message_id}", body: body, &block)
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
  def destroy_message(room_id:, message_id:, &block)
    delete("/rooms/#{room_id}/messages/#{message_id}", &block)
  end
end
