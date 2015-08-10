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

      def board
        @board ||= Board.new
      end

  end
end

