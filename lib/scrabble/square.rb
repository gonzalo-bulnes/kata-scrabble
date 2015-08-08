module Scrabble
  class Square

    attr_reader :column, :line

    def initialize(column_name, line_name)
      @column = column_name
      @line = line_name
    end

    def to_s
      '  '
    end
  end
end

