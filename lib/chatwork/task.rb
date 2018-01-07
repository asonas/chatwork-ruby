module ChatWork
  class Task < Entity
    install_class_operations :_get, :_create

    def self.path
      "/rooms/%d/tasks"
    end
  end
end
