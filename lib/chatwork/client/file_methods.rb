module ChatWork::Client::FileMethods
  # Get the list of files associated with the specified chat
  #
  # @param room_id [Integer]
  # @param account_id [Integer]
  #
  # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id-files
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
  def get_files(room_id:, account_id:, &block)
    get("/rooms/#{room_id}/files", account_id: account_id, &block)
  end

  # Get information about the specified file
  #
  # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id-files-file_id
  # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
  #
  # @param room_id [Integer]
  # @param file_id [Integer]
  # @param create_download_url [Boolean] whether or not to create a download link.
  #                                      If set to true, download like will be created for 30 seconds
  #
  # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
  # @yieldparam response_body [Hashie::Mash] response body
  # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
  #
  # @return [Hashie::Mash]
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
  def find_file(room_id:, file_id:, create_download_url: nil, &block)
    get("/rooms/#{room_id}/files/#{file_id}", create_download_url: boolean_to_integer(create_download_url), &block)
  end

  # Upload a new file to room
  #
  # @see http://developer.chatwork.com/ja/endpoint_rooms.html#POST-rooms-room_id-files
  # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
  #
  # @param room_id [Integer]
  # @param file    [Faraday::UploadIO]
  # @param message [String]
  #
  # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
  # @yieldparam response_body [Hashie::Mash] response body
  # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
  #
  # @return [Hashie::Mash]
  #
  # @example how to upload a file
  #   client = ChatWork::Client.new(api_key: "XXX")
  #   client.create_file(room_id: 11111111, file: Faraday::UploadIO.new("/path/to/file.txt", "text/plain"), message: "Test")
  #
  # @example response format
  #   {
  #     "file_id": 1234
  #   }
  #
  def create_file(room_id:, file:, message: nil, &block)
    params = {
      file:    file,
      message: message,
    }

    post("/rooms/#{room_id}/files", params, &block)
  end

  alias_method :upload_file, :create_file
end
