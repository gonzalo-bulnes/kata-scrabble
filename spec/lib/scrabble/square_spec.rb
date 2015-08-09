require 'spec_helper'

module Scrabble
  describe Square do

    let(:square) { Square.new(:A, 1) }

    it { expect(square).to respond_to :to_s }
    it { expect(square).to respond_to :column }
    it { expect(square).to respond_to :line }
    it { expect(square).to respond_to :double_letter_score! }
    it { expect(square).to respond_to :triple_letter_score! }
    it { expect(square).to respond_to :double_word_score! }
    it { expect(square).to respond_to :triple_word_score! }
    it { expect(square).to respond_to :star! }

    describe '#to_s' do

      describe 'as a text representation of the square' do

        it 'returns "  "' do
          expect(square.to_s).to eq '  '
        end

        context 'when the square doubles the letter score' do

          it 'returns "2 "' do
            square.double_letter_score!
            expect(square.to_s).to eq '2 '
          end
        end

        context 'when the square triples the letter score' do

          it 'returns "3 "' do
            square.triple_letter_score!
            expect(square.to_s).to eq '3 '
          end
        end

        context 'when the square doubles the word score' do

          it 'returns "2!"' do
            square.double_word_score!
            expect(square.to_s).to eq '2!'
          end
        end

        context 'when the square triples the word score' do

          it 'returns "3!"' do
            square.triple_word_score!
            expect(square.to_s).to eq '3!'
          end
        end


        context 'when the square is the central square' do

          it 'returns "⋆ "' do
            square.star!
            expect(square.to_s).to eq '⋆ '
          end
        end
      end
    end

    describe '#column' do

      it 'returns the square column name' do
        expect(square.column).to eq :A
      end
    end

    describe '#line' do

      it 'returns the square line name' do
        expect(square.line).to eq 1
      end
    end
  end
end

