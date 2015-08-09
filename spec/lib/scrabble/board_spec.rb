require 'spec_helper'

module Scrabble
  describe Board do

    let(:board) { Board.new }

    it { expect(:board).to respond_to :to_s }

    describe '#to_s' do

      it 'returns a text representation of the board' do
        expect(board.to_s).to eq <<-BOARD
    A B C D E F G H I J K L M N O 
  1 3!    2       3!      2     3!
  2   2!      3       3       2!  
  3     2!      2   2       2!    
  4 2     2!      2       2!    2 
  5         2!          2!        
  6   3       3       3       3   
  7     2       2   2       2     
  8 3!    2       ⋆       2     3!
  9     2       2   2       2     
 10   3       3       3       3   
 11         2!          2!        
 12 2     2!      2       2!    2 
 13     2!      2   2       2!    
 14   2!      3       3       2!  
 15 3!    2       3!      2     3!
        BOARD
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
  end
end

