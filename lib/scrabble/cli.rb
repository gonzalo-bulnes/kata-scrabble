require 'thor'

require 'scrabble'

module Scrabble
  class CLI < Thor

    desc 'start', 'Start a new game.'
    def start(error=STDERR, input=STDIN, out=STDOUT)
      game(error, input, out).run
    end

    private

      def game(error, input, out)
        @game ||= Game.new(error, input, out)
      end
  end
end

