module ChatWork
  module Room
    # Get the list of all chats on your account
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms
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
    #       "room_id": 123,
    #       "name": "Group Chat Name",
    #       "type": "group",
    #       "role": "admin",
    #       "sticky": false,
    #       "unread_num": 10,
    #       "mention_num": 1,
    #       "mytask_num": 0,
    #       "message_num": 122,
    #       "file_num": 10,
    #       "task_num": 17,
    #       "icon_path": "https://example.com/ico_group.png",
    #       "last_update_time": 1298905200
    #     }
    #   ]
    def self.get(&block)
      ChatWork.client.get_rooms(&block)
    end

    # rubocop:disable Metrics/ParameterLists

    # Create a new group chat
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#POST-rooms
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param description [String] Description of the group chat
    # @param icon_preset [String] Type of the group chat icon (group, check, document, meeting, event, project, business,
    #                             study, security, star, idea, heart, magcup, beer, music, sports, travel)
    # @param members_admin_ids [Array<Integer>, String] List of user IDs who will be given administrator permission for the group chat.
    #                                                   At least one user must be specified as an administrator.
    # @param members_member_ids [Array<Integer>, String] List of user IDs who will be given member permission for the group chat.
    # @param members_readonly_ids [Array<Integer>, String] List of user IDs who will be given read-only permission for the group chat.
    # @param name [String] Title of the group chat.
    # @param link [Boolean] whether create invitation link
    # @param link_code [String] link path (default. random string)
    # @param link_need_acceptance [Boolean] Approval necessity. Whether participation requires administrator approval.
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "room_id": 1234
    #   }
    def self.create(description: nil, icon_preset: nil, members_admin_ids:, members_member_ids: nil, members_readonly_ids: nil, name:,
                    link: nil, link_code: nil, link_need_acceptance: nil, &block)
      ChatWork.client.create_room(
        description:          description,
        icon_preset:          icon_preset,
        members_admin_ids:    members_admin_ids,
        members_member_ids:   members_member_ids,
        members_readonly_ids: members_readonly_ids,
        name:                 name,
        link:                 link,
        link_code:            link_code,
        link_need_acceptance: link_need_acceptance,
        &block
      )
    end

    # rubocop:enable Metrics/ParameterLists

    # Get chat name, icon, and Type (my, direct, or group)
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "room_id": 123,
    #     "name": "Group Chat Name",
    #     "type": "group",
    #     "role": "admin",
    #     "sticky": false,
    #     "unread_num": 10,
    #     "mention_num": 1,
    #     "mytask_num": 0,
    #     "message_num": 122,
    #     "file_num": 10,
    #     "task_num": 17,
    #     "icon_path": "https://example.com/ico_group.png",
    #     "last_update_time": 1298905200,
    #     "description": "room description text"
    #   }
    def self.find(room_id:, &block)
      ChatWork.client.find_room(room_id: room_id, &block)
    end

    # Change the title and icon type of the specified chat
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#PUT-rooms-room_id
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param description [String] Description of the group chat
    # @param icon_preset [String] Type of the group chat icon (group, check, document, meeting, event, project, business,
    #                             study, security, star, idea, heart, magcup, beer, music, sports, travel)
    # @param name [String] Title of the group chat.
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
    #
    # @example response format
    #   {
    #     "room_id": 1234
    #   }
    def self.update(room_id:, description: nil, icon_preset: nil, name: nil, &block)
      ChatWork.client.update_room(room_id: room_id, description: description, icon_preset: icon_preset, name: name, &block)
    end

    # Leave/Delete a group chat
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#DELETE-rooms-room_id
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @param room_id [Integer]
    # @param action_type [String] leave from a room or delete a room (leave, delete)
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    def self.destroy(room_id:, action_type:, &block)
      ChatWork.client.destroy_room(room_id: room_id, action_type: action_type, &block)
    end
  end
end
