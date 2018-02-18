module ChatWork::Client::MyTaskMethods
  # Get the list of all unfinished tasks
  #
  # (*This method returns up to 100 entries. We are planning to implement pagination to support larger number of data retrieval)
  #
  # @see http://developer.chatwork.com/ja/endpoint_my.html#GET-my-tasks
  # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
  #
  # @param assigned_by_account_id [Integer] Account ID of the person who assigned task
  # @param status [String] Task status (open, done)
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
  #       "task_id": 3,
  #       "room": {
  #         "room_id": 5,
  #         "name": "Group Chat Name",
  #         "icon_path": "https://example.com/ico_group.png"
  #       },
  #       "assigned_by_account": {
  #         "account_id": 456,
  #         "name": "Anna",
  #         "avatar_image_url": "https://example.com/def.png"
  #       },
  #       "message_id": "13",
  #       "body": "buy milk",
  #       "limit_time": 1384354799,
  #       "status": "open"
  #     }
  #   ]
  def get_my_tasks(assigned_by_account_id: nil, status: nil, &block)
    get("/my/tasks", assigned_by_account_id: assigned_by_account_id, status: status, &block)
  end
end
