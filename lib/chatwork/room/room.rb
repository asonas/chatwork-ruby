module ChatWork
  class Room
    class Message < Entity
      install_class_operations :create

      def self.path
        "/rooms/#{id}/messages"
      end

      def path
        "/rooms/#{id}/messages"
      end
    end
  end
end
