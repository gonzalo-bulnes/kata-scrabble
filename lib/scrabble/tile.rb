module Scrabble
  class Tile

    attr_reader :name, :value

    def initialize(name, value)
      @name = name.to_sym
      @value = value # Fixnum expected
    end

    def to_s
      "#{name.to_s} "
    end
  end
end

