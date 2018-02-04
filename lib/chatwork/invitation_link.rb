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
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "public": true,
    #     "url": "https://example.chatwork.com/g/randomcode42",
    #     "need_acceptance": true,
    #     "description": "Link description text"
    #   }
    def self.get(room_id:)
      _get("/rooms/#{room_id}/link")
    end
  end
end
