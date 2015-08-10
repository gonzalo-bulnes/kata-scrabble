require 'scrabble/square'

module Scrabble
  class Board

    HEIGHT = 15
    WIDTH = 15

    DOUBLE_LETTER_SCORE_SQUARES = [ [:D, 1], [:L, 1], [:G, 3], [:I, 3],
                                    [:A, 4], [:H, 4], [:O, 4],
                                    [:C, 7], [:G, 7], [:I, 7], [:M, 7],
                                    [:D, 8], [:L, 8],
                                    [:C, 9], [:G, 9], [:I, 9], [:M, 9],
                                    [:A, 12], [:H, 12], [:O, 12],
                                    [:G, 13], [:I, 13], [:D, 15], [:L, 15] ]
    DOUBLE_WORD_SCORE_SQUARES = [ [:B, 2], [:N, 2],
                                  [:C, 3], [:M, 3],
                                  [:D, 4], [:L, 4],
                                  [:E, 5], [:K, 5],
                                  [:E, 11], [:K, 11],
                                  [:D, 12], [:L, 12],
                                  [:C, 13], [:M, 13],
                                  [:B, 14], [:N, 14] ]
    TRIPLE_LETTER_SCORE_SQUARES = [ [:F, 2], [:J, 2],
                                    [:B, 6], [:F, 6], [:J, 6], [:N, 6],
                                    [:B, 10], [:F, 10], [:J, 10], [:N, 10],
                                    [:F, 14], [:J, 14] ]
    TRIPLE_WORD_SCORE_SQUARES = [ [:A, 1], [:H, 1], [:O, 1],
                                  [:A, 8], [:O, 8],
                                  [:A, 15], [:H, 15], [:O, 15] ]
    STAR_SQUARE = [:H, 8]

    def initialize
      @columns_names = (:A..:Z).to_a.first(width)
      @lines_names  = (1..HEIGHT).to_a
      squares; promote_squares!
    end

    def to_s
      lines.inject([columns_header]) { |board_lines, line_and_name| board_lines << line_header(line_and_name[0]) + line_and_name[1].join }.join("\n") + "\n"
    end

    private

      attr_reader :columns_names, :lines_names

      def height
        HEIGHT
      end

      def width
        WIDTH
      end

      def initialize_squares!
        lines_names.inject([]) do |_, line_name|
          columns_names.each do |column_name|
            _ << Square.new(column_name, line_name)
          end
          _
        end
      end

      def promote_squares!
        DOUBLE_LETTER_SCORE_SQUARES.each do |name|
          square(*name).double_letter_score!
        end
        DOUBLE_WORD_SCORE_SQUARES.each do |name|
          square(*name).double_word_score!
        end
        TRIPLE_LETTER_SCORE_SQUARES.each do |name|
          square(*name).triple_letter_score!
        end
        TRIPLE_WORD_SCORE_SQUARES.each do |name|
          square(*name).triple_word_score!
        end
        square(*STAR_SQUARE).star!
      end

      def squares
        @squares ||= initialize_squares!
      end

      def square(column_name, line_name)
        squares.select { |square| square.column == column_name && square.line == line_name }.first
      end

      def line(name)
        squares.select { |square| square.line == name }
      end

      def lines
        lines_names.inject({}) { |_, name| _[name] = line(name); _ }
      end

      def line_header(line_name)
        "#{line_name} ".rjust(4)
      end

      def columns_header
        line_header(nil) + columns_names.map { |column_name| column_name.to_s + ' ' }.join
      end
  end
end

