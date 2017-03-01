module ChatWork
  module Operations
    ACCEPT_PARAMS_ID = %i(file_id task_id message_id)

    attr_accessor :assign_path

    def install_class_operations(*operations)
      define_create if operations.include?(:create)
      define_get if operations.include?(:get)
    end

    def define_get
      instance_eval do
        def get(params = {}, &block)
          @assign_path = parse_if_hash_key_exists(path, params, :room_id)
          attach_nested_resource_id(params)
          convert(ChatWork.client.get(@assign_path, params, &block))
        end
      end
    end

    def define_create
      instance_eval do
        def create(params = {}, &block)
          @assign_path = parse_if_hash_key_exists(path, params, :room_id)
          attach_nested_resource_id(params)
          convert(ChatWork.client.post(@assign_path, params, &block))
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

    def attach_nested_resource_id(params)
      ACCEPT_PARAMS_ID.each do |id_name|
        next unless params.include? id_name
        @assign_path += "/#{params.delete(id_name)}"
      end
    end
  end
end
