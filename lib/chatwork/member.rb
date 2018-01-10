module ChatWork
  module Member
    extend EntityMethods

    # Get the list of all chat members associated with the specified chat
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id-members
    #
    # @param room_id [Integer]
    #
    # @return [Array<Hash>]
    #
    # @example response format
    #   [
    #     {
    #       "account_id": 123,
    #       "role": "member",
    #       "name": "John Smith",
    #       "chatwork_id": "tarochatworkid",
    #       "organization_id": 101,
    #       "organization_name": "Hello Company",
    #       "department": "Marketing",
    #       "avatar_image_url": "https://example.com/abc.png"
    #     }
    #   ]
    def self.get(room_id:)
      _get("/rooms/#{room_id}/members")
    end
  end
end
