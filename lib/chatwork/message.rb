module ChatWork
  module Message
    extend EntityMethods

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
    def self.get(room_id:, force: nil)
      _get("/rooms/#{room_id}/messages", force: boolean_to_integer(force))
    end

    # Add new message to the chat
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#POST-rooms-room_id-messages
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param body    [String] message body
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "message_id": "1234"
    #   }
    def self.create(room_id:, body:)
      _post("/rooms/#{room_id}/messages", body: body)
    end

    # Mark messages as read
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#PUT-rooms-room_id-messages-read
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param message_id [String]
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "unread_num": 461,
    #     "mention_num": 0
    #   }
    def self.read(room_id:, message_id: nil)
      _put("/rooms/#{room_id}/messages/read", message_id: message_id)
    end

    # Mark messages as unread
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#PUT-rooms-room_id-messages-unread
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param message_id [String]
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "unread_num": 3,
    #     "mention_num": 0
    #   }
    def self.unread(room_id:, message_id:)
      _put("/rooms/#{room_id}/messages/unread", message_id: message_id)
    end

    # Get information about the specified message
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id-messages-message_id
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param message_id [String]
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
    def self.find(room_id:, message_id:)
      _get("/rooms/#{room_id}/messages/#{message_id}")
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
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "message_id": "1234"
    #   }
    def self.update(room_id:, message_id:, body:)
      _put("/rooms/#{room_id}/messages/#{message_id}", body: body)
    end

    # Destroy the specified message
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#PUT-rooms-room_id-messages-message_id
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param message_id [String]
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "message_id": "1234"
    #   }
    def self.destroy(room_id:, message_id:)
      _delete("/rooms/#{room_id}/messages/#{message_id}")
    end
  end
end
