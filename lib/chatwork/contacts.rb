module ChatWork
  module Contacts
    extend EntityMethods

    # Get the list of your contacts
    #
    # @see http://developer.chatwork.com/ja/endpoint_contacts.html#GET-contacts
    # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
    #
    # @return [Array<Hash>]
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
    def self.get
      _get("/contacts")
    end
  end
end
