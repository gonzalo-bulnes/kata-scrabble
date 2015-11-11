require 'scrabble/board'
require 'scrabble/configuration'
require 'scrabble/player'
require 'scrabble/rule'
require 'scrabble/tile'

module Scrabble
  class Game

    attr_reader :error, :input, :out
    private :error, :input, :out

    def initialize(error, input, out)
      @error = error
      @input = input
      @out = out
    end

    def run
      error.puts board.to_s
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

      # Returns an Array of Tiles
      def remaining_tiles
        @remaining_tiles ||= Configuration.default_tiles_bag
      end
      alias :bag :remaining_tiles

      # How many times in a row did players pass
      #
      # Returns a Fixnum
      def successive_pass_count
        @successive_pass_count ||= 0
      end

  end
end

