module ChatWork
  class MyTask < Entity
    install_class_operations :_get

    def self.path
      "/my/tasks"
    end

    def path
      "/my/tasks"
    end
  end
end
