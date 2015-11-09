module Scrabble
  class Player

    attr_reader :name

    def initialize(name)
      @name = name
    end

    def to_s
      name.to_s
    end

    def tiles
      @tiles ||= []
    end
  end
end

