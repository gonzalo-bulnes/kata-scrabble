require 'scrabble/squares/double_letter_score_square'
require 'scrabble/squares/triple_letter_score_square'
require 'scrabble/squares/double_word_score_square'
require 'scrabble/squares/triple_word_score_square'
require 'scrabble/squares/star_square'
require 'scrabble/tile'

module Scrabble
  class Square

    attr_reader :column, :line
    attr_writer :tile

    def initialize(column_name, line_name)
      @column = column_name
      @line = line_name
    end

    def to_s
      '  '
    end

    def double_letter_score!
      promote_to!(Squares::DoubleLetterScoreSquare)
    end

    def triple_letter_score!
      promote_to!(Squares::TripleLetterScoreSquare)
    end

    def double_word_score!
      promote_to!(Squares::DoubleWordScoreSquare)
    end

    def triple_word_score!
      promote_to!(Squares::TripleWordScoreSquare)
    end

    def star!
      promote_to!(Squares::StarSquare)
    end

    def tile
      @tile ||= nil
    end

    def empty?
      tile.nil?
    end

    private

      # Modify the square's type so it starts behaving accordingly.
      #
      # Please do notice that the new type methods will take precedence
      # over the square instance methods.
      #
      # How it works:
      #
      # The Module#prepend method allows to include a module in a way
      # that allows its own instance methods to take precedence over the
      # instance methods defined in the class that includes it.
      # That's the first half of the magic.
      #
      # We don't want all Square instances to get promoted this way, and
      # that's why the module passed as argument is not included in
      # the Square class, but is included in the square instance singleton
      # class instead. Since that square instance is the only one which
      # inherits from its singleton class (by defnition), it's the only
      # one whose mehtods get overrided! Magic :)
      #
      # Interest:
      #
      # What's the interest of this? We can create all the squares the same,
      # then promote them on demand, and eventually delegate the responsabilty
      # of their promotion to a Scores module or whatever.
      #
      # Example:
      #
      #     to_s
      #     # => '  '
      #     promote_to!(Squares::DoubleLetterScoreSquare)
      #     kind_of? Squares::DoubleLetterScoreSquare
      #     # => true
      #     to_s
      #     # => '2 '
      #
      # Returns nothing.
      def promote_to!(type)
        self.singleton_class.class_eval do
          prepend type
        end
      end
  end
end

