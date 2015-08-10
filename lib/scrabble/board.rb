require 'scrabble/square'

module Scrabble
  class Board

    def initialize
      @columns_names = (:A..:Z).to_a.first(width)
      @lines_names  = (1..height).to_a
      squares; promote_squares!
    end

    def to_s
      lines.inject([columns_header]) { |board_lines, line_and_name| board_lines << line_header(line_and_name[0]) + line_and_name[1].join }.join("\n") + "\n"
    end

    private

      attr_reader :columns_names, :lines_names

      def height
        Configuration::BOARD_HEIGHT
      end

      def width
        Configuration::BOARD_WIDTH
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
        Configuration::DOUBLE_LETTER_SCORE_SQUARES.each do |name|
          square(*name).double_letter_score!
        end
        Configuration::DOUBLE_WORD_SCORE_SQUARES.each do |name|
          square(*name).double_word_score!
        end
        Configuration::TRIPLE_LETTER_SCORE_SQUARES.each do |name|
          square(*name).triple_letter_score!
        end
        Configuration::TRIPLE_WORD_SCORE_SQUARES.each do |name|
          square(*name).triple_word_score!
        end
        square(*Configuration::STAR_SQUARE).star!
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

