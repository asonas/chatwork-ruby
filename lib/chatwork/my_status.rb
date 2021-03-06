module ChatWork
  module MyStatus
    # Get the number of: unread messages, unread To messages, and unfinished tasks.
    #
    # @see http://developer.chatwork.com/ja/endpoint_my.html#GET-my-status
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
    # @yieldparam response_body [Hashie::Mash] response body
    # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
    #
    # @return [Hashie::Mash]
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
    def self.get(&block)
      ChatWork.client.get_my_status(&block)
    end
  end
end
