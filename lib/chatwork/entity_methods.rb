module ChatWork
  module EntityMethods
    private

      def _get(path, params = {}, &block)
        ChatWork.client.get(path, hash_compact(params), &block)
      end

      def _post(path, params = {}, &block)
        ChatWork.client.post(path, hash_compact(params), &block)
      end

      def _put(path, params = {}, &block)
        ChatWork.client.put(path, hash_compact(params), &block)
      end

      def _delete(path, params = {}, &block)
        ChatWork.client.delete(path, hash_compact(params), &block)
      end

      def hash_compact(hash)
        hash.reject { |_k, v| v.nil? }
      end

      def boolean_to_integer(value)
        case value
        when true
          1
        when false
          0
        else
          value
        end
      end
  end
end
