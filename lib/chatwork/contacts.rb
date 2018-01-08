module ChatWork
  class Contacts < Entity
    install_class_operations :_get

    # Get the list of your contacts
    #
    # @see http://developer.chatwork.com/ja/endpoint_contacts.html#GET-contacts
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
      _get
    end

    def self.path
      "/contacts"
    end

    def path
      "/contacts"
    end
  end
end
