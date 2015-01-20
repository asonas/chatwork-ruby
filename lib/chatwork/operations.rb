module ChatWork
  module Operations
    def install_class_operations(*operations)
      define_create if operations.include?(:create)
      define_get if operations.include?(:get)
    end

    def define_get
      instance_eval do
        def get(params = {})
          convert(ChatWork.client.get(path, params))
        end
      end
    end

    def define_create
      instance_eval do
        def create(params = {})
          # TODO: Consider other pattern
          # /rooms and /rooms/:room_id
          assign_path = parse_if_hash_key_exists(path, params, :room_id)
          convert(ChatWork.client.post(assign_path, params))
        end
      end
    end

    private
    def parse_if_hash_key_exists(string, hash, key)
      if hash.include?(key)
        string % hash.delete(key)
      else
        string
      end
    end
  end
end
