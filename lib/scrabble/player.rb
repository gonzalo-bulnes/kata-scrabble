module Scrabble
  class Player

    attr_reader :name

    def initialize(name)
      @name = name
    end

    def to_s
      name.to_s
    end

    # Returns the list of tiles in the player's rack
    def tiles
      @tiles ||= []
    end
  end
end

