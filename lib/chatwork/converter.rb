module ChatWork
  module Converter
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
