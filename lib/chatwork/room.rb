module ChatWork
  module Room
    extend EntityMethods

    # Get the list of all chats on your account
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms
    #
    # @return [Array<Hash>]
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
    def self.get
      _get("/rooms")
    end

    # rubocop:disable Metrics/ParameterLists

    # Create a new group chat
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#POST-rooms
    #
    # @param description [String] Description of the group chat
    # @param icon_preset [String] Type of the group chat icon (group, check, document, meeting, event, project, business,
    #                             study, security, star, idea, heart, magcup, beer, music, sports, travel)
    # @param members_admin_ids [Array<Integer>, String] List of user IDs who will be given administrator permission for the group chat.
    #                                                   At least one user must be specified as an administrator.
    # @param members_member_ids [Array<Integer>, String] List of user IDs who will be given member permission for the group chat.
    # @param members_readonly_ids [Array<Integer>, String] List of user IDs who will be given read-only permission for the group chat.
    # @param name [String] Title of the group chat.
    #
    # @return [Hash]
    #
    # @example response format
    #   {
    #     "room_id": 1234
    #   }
    def self.create(description: nil, icon_preset: nil, members_admin_ids:, members_member_ids: nil, members_readonly_ids: nil, name:)
      params = {
        description:       description,
        icon_preset:       icon_preset,
        members_admin_ids: Array(members_admin_ids).join(","),
        name:              name,
      }
      params[:members_member_ids] = Array(members_member_ids).join(",") if members_member_ids
      params[:members_readonly_ids] = Array(members_readonly_ids).join(",") if members_readonly_ids

      _post("/rooms", params)
    end

    # rubocop:enable Metrics/ParameterLists

    # Get chat name, icon, and Type (my, direct, or group)
    #
    # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id
    #
    # @param room_id [Integer]
    #
    # @return [Hash]
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
    def self.find(room_id:)
      _get("/rooms/#{room_id}")
    end
  end
end
