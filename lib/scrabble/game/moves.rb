module Scrabble
  class Game
    module Moves

      # Returns a Tile or nil
      def pick_tile
        tile = Tile.new(:Q, 10)
        tile
      end

      def pass
        increment_successive_pass_count
      end

      def swap_tile(tile)
        deny('There are no tiles left in the bag!') if bag.empty?
        reset_successive_pass_count
        bag.push tile
        pick_tile
      end

      # Attempts to place a word in the desired location
      #
      # word - a Word
      # location - a Board::Location
      #
      # Returns the value of the word in points (Fixnum) or raises an error
      def place(word, location)
        deny("\"#{word}\" is not a valid word!.") unless word.valid?
        deny("\"#{word}\" cannot be placed at #{location}.") unless location.correct?(word, board)
        reset_successive_pass_count
        board.place!(word, location)
      end
    end
  end
end
