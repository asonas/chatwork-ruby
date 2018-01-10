module ChatWork
  module File
    extend EntityMethods

    # Get the list of files associated with the specified chat
    #
    # @param room_id [Integer]
    # @param account_id [Integer]
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id-files
    #
    # @return [Array<Hash>]
    #
    # @example response format
    #   [
    #     {
    #       "file_id": 3,
    #       "account": {
    #         "account_id": 123,
    #         "name": "Bob",
    #         "avatar_image_url": "https://example.com/ico_avatar.png"
    #       },
    #       "message_id": "22",
    #       "filename": "README.md",
    #       "filesize": 2232,
    #       "upload_time": 1384414750
    #     }
    #   ]
    def self.get(room_id:, account_id:)
      _get("/rooms/#{room_id}/files", account_id: account_id)
    end
  end
end
