module ChatWork
  class Member < Entity
    install_class_operations :get

    def self.path
      "/rooms/%d/members"
    end
  end
end
