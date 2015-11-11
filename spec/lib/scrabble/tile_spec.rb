require 'spec_helper'

module Scrabble
  describe Tile do

    let(:tile) { Tile.new(:M, 3) }

    it { expect(tile).to respond_to :name }
    it { expect(tile).to respond_to :value }

    describe '#name' do

      it 'returns a Symbol' do
        expect(tile.name).to be_kind_of Symbol
      end
    end

    describe '#value' do

      it 'returns a Fixnum' do
        expect(tile.value).to be_kind_of Fixnum
      end
    end
  end
end
