module ChatWork
  module Member
    extend EntityMethods

    # Get the list of all chat members associated with the specified chat
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id-members
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    #
    # @return [Array<Hashie::Mash>]
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

    # Change associated members of group chat at once
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#PUT-rooms-room_id-members
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param members_admin_ids [Array<Integer>, String] List of user IDs who will be given administrator permission for the group chat.
    #                                                   At least one user must be specified as an administrator.
    # @param members_member_ids [Array<Integer>, String] List of user IDs who will be given member permission for the group chat.
    # @param members_readonly_ids [Array<Integer>, String] List of user IDs who will be given read-only permission for the group chat.
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    # {
    #   "admin": [123, 542, 1001],
    #   "member": [10, 103],
    #   "readonly": [6, 11]
    # }
    def self.update_all(room_id:, members_admin_ids:, members_member_ids: nil, members_readonly_ids: nil)
      params = {
        members_admin_ids: Array(members_admin_ids).join(","),
      }
      params[:members_member_ids] = Array(members_member_ids).join(",") if members_member_ids
      params[:members_readonly_ids] = Array(members_readonly_ids).join(",") if members_readonly_ids

      _put("/rooms/#{room_id}/members", params)
    end
  end
end
