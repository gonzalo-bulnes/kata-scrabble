require 'spec_helper'

module Scrabble
  describe Player do

    let(:player) { Player.new('Alice') }

    it { expect(player).to respond_to :name }
    it { expect(player).to respond_to :tiles }

    describe '#name' do

      it 'returns a String' do
        expect(player.name).to be_kind_of String
      end
    end

    describe '#tiles', private: true do

      it 'returns an (eventually empty) Array of Tiles' do
        expect(player.send(:tiles)).to be_kind_of Array
      end
    end
  end
end
