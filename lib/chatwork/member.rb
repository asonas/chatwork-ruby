module ChatWork
  module Member
    # Get the list of all chat members associated with the specified chat
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id-members
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
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
    def self.get(room_id:, &block)
      ChatWork.client.get_members(room_id: room_id, &block)
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
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "admin": [123, 542, 1001],
    #     "member": [10, 103],
    #     "readonly": [6, 11]
    #   }
    def self.update_all(room_id:, members_admin_ids:, members_member_ids: nil, members_readonly_ids: nil, &block)
      ChatWork.client.update_all_members(
        room_id:              room_id,
        members_admin_ids:    members_admin_ids,
        members_member_ids:   members_member_ids,
        members_readonly_ids: members_readonly_ids,
        &block
      )
    end
  end
end
