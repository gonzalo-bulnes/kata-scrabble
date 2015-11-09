require 'spec_helper'

module Scrabble
  describe Board do

    let(:board) { Board.new }

    it { expect(:board).to respond_to :to_s }

    describe '#to_s' do

      it 'returns a text representation of the board' do
        expect(board.to_s).to eq Fixtures::EMPTY_BOARD
      end
    end

    describe '#line', private: true do

      let(:line) { board.send(:line, 12) }
      let(:line_size) { line.size }
      let(:line_element) { line.first }
      let(:squares_line) { line_element.line }

      it 'returns a line of squares' do
        expect(line_size).to eq board.send(:width)
        expect(line_element).to be_kind_of Square
        expect(squares_line).to eq 12
      end
    end

    describe '#squares', private: true do

      it 'returns an Array of Squares' do
        expect(board.send(:squares)).to be_kind_of Array
        expect(board.send(:squares)).not_to be_empty
        expect(board.send(:squares)[0]).to be_kind_of Square
      end
    end
  end
end

