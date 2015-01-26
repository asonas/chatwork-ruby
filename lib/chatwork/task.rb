module ChatWork
  class Task < Entity
    install_class_operations :get, :create

    def self.path
      "/rooms/%d/tasks"
    end
  end
end
