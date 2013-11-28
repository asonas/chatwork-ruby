module ChatWork
  class Room < Entity
    install_class_operations :create

    def self.path
      '/rooms'
    end

    def message
      ChatWork.client.post([path, 'messages'].join('/'), params)
    end

    def path
      "/rooms/#{id}"
    end
  end
end
