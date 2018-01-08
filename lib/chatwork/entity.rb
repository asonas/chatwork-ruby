module ChatWork
  class Entity
    class << self
      include Operations
      def convert(hash)
        # not implement
        # converter = ResponseConverter.new
        # converter.convert(hash)
        hash
      end

      def hash_compact(hash)
        hash.reject { |_k, v| v.nil? }
      end
    end

    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes
    end

    private

      # not implement
      def update_attributes(attributes)
        raise "unexpected object" if attributes["object"] != @attributes["object"]
        new_object = ResponseConverter.new.convert(attributes)
        @attributes = new_object.attributes
        self
      end
  end
end
