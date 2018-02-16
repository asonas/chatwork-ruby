module ChatWork
  module Contacts
    # Get the list of your contacts
    #
    # @see http://developer.chatwork.com/ja/endpoint_contacts.html#GET-contacts
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
    #       "account_id": 123,
    #       "room_id": 322,
    #       "name": "John Smith",
    #       "chatwork_id": "tarochatworkid",
    #       "organization_id": 101,
    #       "organization_name": "Hello Company",
    #       "department": "Marketing",
    #       "avatar_image_url": "https://example.com/abc.png"
    #     }
    #   ]
    def self.get(&block)
      ChatWork.client.get_contacts(&block)
    end
  end
end
