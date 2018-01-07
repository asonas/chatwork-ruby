module ChatWork
  class Message < Entity
    install_class_operations :_create, :_get

    def self.path
      "/rooms/%d/messages"
    end

    def path
      "/rooms/%d/messages"
    end
  end
end
