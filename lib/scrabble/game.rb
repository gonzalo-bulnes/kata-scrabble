require 'scrabble/board'
require 'scrabble/player'
require 'scrabble/rule'
require 'scrabble/tile'

module Scrabble
  class Game

    attr_reader :error, :input, :out, :pass_count, :turn_count
    private :error, :input, :out

    def initialize(error, input, out)
      @error = error
      @input = input
      @out = out
      @pass_count = 0
      @turn_count = 0
    end

    def run
      error.puts board.to_s

      initialize_players_racks!
      turn until ended?
    end

    def turn
      @turn_count += 1
      current_player.play(self)
    end

    # Provides each player with 7 tiles from the tiles bag
    #
    # Returns nothing.
    def initialize_players_racks!
      players.each do |player|
        7.times do
          player.pick_tile!(remaining_tiles.shuffle)
        end
      end
    end

    def ended?
      all_players_passed_twice_in_a_row? ||
      (bag.empty? && any_player_has_no_more_tiles?)
    end

    def pass!
      @pass_count += 1
    end

    def done
      players.push players.shift
    end

    def players_count
      players.count
    end

    private

      # Returns a Board
      def board
        @board ||= Board.new
      end

      # Returns an Array of Players
      def players
        @players ||= [Player.new('Alice'), Player.new('Bob'), Player.new('Charles'), Player.new('Dani')]
      end

      # Returns a Player
      def current_player
        players[0]
      end

      # Returns an Array of Rules
      def rules
        @rules ||= [Rule.new('Tiles cannot be placed out of the board.')]
      end

      # Returns a Player
      def current_player
        players[0]
      end

      # Returns an Array of Tiles
      def remaining_tiles
        @remaining_tiles ||= Configuration.default_tiles
      end
      alias :bag :remaining_tiles

      def any_player_has_no_more_tiles?
        false
      end

      def all_players_passed_twice_in_a_row?
        pass_count >= 2 * players_count
      end
  end
end
