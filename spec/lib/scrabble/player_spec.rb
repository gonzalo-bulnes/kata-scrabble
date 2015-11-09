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

    describe '#pick_tile!' do

      it "move a tile from a tiles bag to the player's rack" do
        tile_A = Tile.new(:A, 1)
        tile_B = Tile.new(:B, 3)
        tile_G = Tile.new(:G, 2)
        bag = [tile_A, tile_B, tile_G]
        expect(player.tiles).to be_empty
        expect(player.pick_tile!(bag))
        expect(player.tiles).to include(tile_A)
        expect(bag).not_to include(tile_A)
      end
    end
  end
end
