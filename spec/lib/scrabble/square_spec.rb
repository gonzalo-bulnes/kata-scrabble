require 'spec_helper'

module Scrabble
  describe Square do

    let(:square) { Square.new(:A, 1) }

    it { expect(square).to respond_to :to_s }
    it { expect(square).to respond_to :column }
    it { expect(square).to respond_to :line }

    describe '#to_s' do

      it 'returns a text respresentation of the square' do
        expect(square.to_s).to eq '  '
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

