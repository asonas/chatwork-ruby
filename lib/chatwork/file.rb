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

    # Get information about the specified file
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id-files-file_id
    #
    # @param room_id [Integer]
    # @param file_id [Integer]
    # @param create_download_url [Boolean] whether or not to create a download link.
    #                                      If set to true, download like will be created for 30 seconds
    #
    # @return [Array<Hash>]
    #
    # @example response format
    #   {
    #     "file_id":3,
    #     "account": {
    #       "account_id":123,
    #       "name":"Bob",
    #       "avatar_image_url": "https://example.com/ico_avatar.png"
    #     },
    #     "message_id": "22",
    #     "filename": "README.md",
    #     "filesize": 2232,
    #     "upload_time": 1384414750
    #   }
    def self.find(room_id:, file_id:, create_download_url: nil)
      _get("/rooms/#{room_id}/files/#{file_id}", create_download_url: boolean_to_integer(create_download_url))
    end
  end
end
