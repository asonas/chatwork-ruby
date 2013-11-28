module ChatWork
  module Operations
    def install_class_operations(*operations)
      define_create if operations.include?(:create)
    end

    def define_create
      instance_eval do
        def create(params = {})
          convert(ChatWork.client.post(path, params))
        end
      end
    end
  end
end
