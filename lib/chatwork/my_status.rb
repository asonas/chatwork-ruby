module ChatWork
  module MyStatus
    extend EntityMethods

    # Get the number of: unread messages, unread To messages, and unfinished tasks.
    #
    # @see http://developer.chatwork.com/ja/endpoint_my.html#GET-my-status
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @return [Hash]
    #
    # @example response format
    #   {
    #     "unread_room_num": 2,
    #     "mention_room_num": 1,
    #     "mytask_room_num": 3,
    #     "unread_num": 12,
    #     "mention_num": 1,
    #     "mytask_num": 8
    #   }
    def self.get
      _get("/my/status")
    end
  end
end
