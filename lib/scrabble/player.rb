module Scrabble
  class Player

    attr_reader :name

    def initialize(name)
      @name = name
    end

    def to_s
      name.to_s
    end

    # Retruns the list of tiles in the player's rack
    def tiles
      @tiles ||= []
    end

    # Moves a tile form a tiles bag to the player's rack
    #
    # Shuffling the bag is recommended.
    #
    # Retunrs nothing.
    def pick_tile!(remaining_tiles)
      tiles << remaining_tiles.shift
    end
  end
end

