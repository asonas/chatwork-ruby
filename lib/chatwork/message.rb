module ChatWork
  module Message
    extend EntityMethods

    # Get all messages associated with the specified chat (returns up to 100 entries).
    #
    # If the parameter is not set, it returns the next 100 entries from previous call.
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id-messages
    #
    # @param room_id [Integer]
    # @param force   [Boolean, Integer] Flag which forces to get 100 newest entries regardless of previous calls.
    #
    # @return [Array<Hash>]
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
      params = {}

      case force
      when 1, true
        params[:force] = 1
      when 0, false
        params[:force] = 0
      end

      _get("/rooms/#{room_id}/messages", params)
    end

    # Add new message to the chat
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#POST-rooms-room_id-messages
    #
    # @param room_id [Integer]
    # @param body    [String] message body
    #
    # @return [Hash]
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
    #
    # @param room_id [Integer]
    # @param message_id [String]
    #
    # @return [Hash]
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
    #
    # @param room_id [Integer]
    # @param message_id [String]
    #
    # @return [Hash]
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
    #
    # @param room_id [Integer]
    # @param message_id [String]
    #
    # @return [Hash]
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
  end
end
