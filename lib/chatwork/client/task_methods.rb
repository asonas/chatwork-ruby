module ChatWork::Client::TaskMethods
  # Get the list of tasks associated with the specified chat
  #
  # (*This method returns up to 100 entries. We are planning to implement pagination to support larger number of data retrieval)
  #
  # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id-tasks
  # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
  #
  # @param room_id [Integer]
  # @param account_id [Integer]
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
  #       "account": {
  #         "account_id": 123,
  #         "name": "Bob",
  #         "avatar_image_url": "https://example.com/abc.png"
  #       },
  #       "assigned_by_account": {
  #         "account_id": 456,
  #         "name": "Anna",
  #         "avatar_image_url": "https://example.com/def.png"
  #       },
  #       "message_id": "13",
  #       "body": "buy milk",
  #       "limit_time": 1384354799,
  #       "status": "open",
  #       "limit_type": "date"
  #     }
  #   ]
  def get_tasks(room_id:, account_id:, assigned_by_account_id: nil, status: nil, &block)
    get("/rooms/#{room_id}/tasks", account_id: account_id, assigned_by_account_id: assigned_by_account_id, status: status, &block)
  end

  # Add a new task to the chat
  #
  # @see http://developer.chatwork.com/ja/endpoint_rooms.html#POST-rooms-room_id-tasks
  # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
  #
  # @param room_id    [Integer]
  # @param body       [String] Task description
  # @param to_ids     [Array<Integer>, String] Account ID of the person/people responsible to complete the task
  # @param limit      [Time, Integer] When the task is due
  # @param limit_type [String] Type of task deadline (e.g. `none`, `date`, `time`)
  #
  # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
  # @yieldparam response_body [Hashie::Mash] response body
  # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
  #
  # @return [Hashie::Mash]
  #
  # @example response format
  #   {
  #     "task_ids": [123,124]
  #   }
  def create_task(room_id:, body:, to_ids:, limit: nil, limit_type: nil, &block)
    params = {
      body:       body,
      to_ids:     Array(to_ids).join(","),
      limit_type: limit_type,
    }
    params[:limit] = limit.to_i if limit

    post("/rooms/#{room_id}/tasks", params, &block)
  end

  # Get information about the specified task
  #
  # @see http://developer.chatwork.com/ja/endpoint_rooms.html#GET-rooms-room_id-tasks-task_id
  # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
  #
  # @param room_id [Integer]
  # @param task_id [Integer]
  #
  # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
  # @yieldparam response_body [Hashie::Mash] response body
  # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
  #
  # @return [Hashie::Mash]
  #
  # @example response format
  #   {
  #     "task_id": 3,
  #     "account": {
  #       "account_id": 123,
  #       "name": "Bob",
  #       "avatar_image_url": "https://example.com/abc.png"
  #     },
  #     "assigned_by_account": {
  #       "account_id": 456,
  #       "name": "Anna",
  #       "avatar_image_url": "https://example.com/def.png"
  #     },
  #     "message_id": "13",
  #     "body": "buy milk",
  #     "limit_time": 1384354799,
  #     "status": "open",
  #     "limit_type": "date"
  #   }
  def find_task(room_id:, task_id:, &block)
    get("/rooms/#{room_id}/tasks/#{task_id}", &block)
  end

  # Update task completion status
  #
  # @see http://developer.chatwork.com/ja/endpoint_rooms.html#PUT-rooms-room_id-tasks-task_id-status
  # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
  #
  # @param room_id [Integer]
  # @param task_id [Integer]
  # @param body [String] Task completion status (e.g. `open`, `done`)
  #
  # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
  # @yieldparam response_body [Hashie::Mash] response body
  # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
  #
  # @return [Hashie::Mash]
  #
  # @example response format
  #   {
  #     "task_id": 1234
  #   }
  def update_task_status(room_id:, task_id:, body:, &block)
    put("/rooms/#{room_id}/tasks/#{task_id}/status", body: body, &block)
  end
end
