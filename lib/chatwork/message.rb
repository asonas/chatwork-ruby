module ChatWork
  class Message < Entity
    install_class_operations :_create, :_get

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
      params = { room_id: room_id }

      case force
      when 1, true
        params[:force] = 1
      when 0, false
        params[:force] = 0
      end

      _get(params)
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
      _create(room_id: room_id, body: body)
    end

    def self.path
      "/rooms/%d/messages"
    end

    def path
      "/rooms/%d/messages"
    end
  end
end
