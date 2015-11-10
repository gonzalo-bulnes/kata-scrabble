require 'spec_helper'

module Scrabble
  describe Game do

    let(:error) { double() }
    let(:input) { double() }
    let(:out) { double() }
    let(:game) { Game.new(error, input, out) }

    it { expect(game).to respond_to :run }
    it { expect(game).to respond_to :initialize_players_racks! }
    it { expect(game).to respond_to :ended? }
    it { expect(game).to respond_to :pass! }
    it { expect(game).to respond_to :turn }

    describe '#run' do

      it 'outputs a welcome board' do
        expect(error).to receive(:puts).with(Fixtures::EMPTY_BOARD)
        game.run
      end

      context 'and there are 3 players' do

        context 'when all players only pass' do

          it 'returns after 6 turns'
        end
      end
    end

    describe '#initialize_players_racks!' do

      it 'provides each player with 7 tiles from the bag' do
        game.initialize_players_racks!
        game.send(:players).each do |player|
          expect(player.tiles.count).to eq 7
        end
      end
    end

    describe '#board', private: true do

      it 'returns a empty board' do
        expect(game.send(:board)).to be_kind_of Board
      end
    end

    describe '#players', private: true do

      it 'returns an array of players' do
        expect(game.send(:players)).to be_kind_of Array
        expect(game.send(:players)).not_to be_empty
        expect(game.send(:players)[0]).to be_kind_of Player
      end
    end

    describe '#current_player', private: true do

      it 'returns the current_player' do
        expect(game.send(:current_player)).to be_kind_of Player
      end
    end

    describe '#rules', private: true do

      it 'returns an array of rules' do
        expect(game.send(:rules)).to be_kind_of Array
        expect(game.send(:rules)).not_to be_empty
        expect(game.send(:rules)[0]).to be_kind_of Rule
      end
    end

    describe '#remaining_tiles', private: true do

      it 'returns an array of tiles' do
        expect(game.send(:remaining_tiles)).to be_kind_of Array
        expect(game.send(:remaining_tiles)).not_to be_empty
        expect(game.send(:remaining_tiles)[0]).to be_kind_of Tile
      end
    end

    describe '#pass', private: true do

      it 'increments the pass counter' do
        expect{ game.pass! }.to change{ game.pass_count }.from(0).to(1)
      end
    end

    describe '#ended?', private: true do

      context 'when the pass count if twice the number of players' do

        it 'returns true' do
          allow(game).to receive(:players_count).and_return(2)

          allow(game).to receive(:pass_count).and_return(4)
          expect(game.ended?).to be true

          allow(game).to receive(:pass_count).and_return(5)
          expect(game.ended?).to be true
        end
      end

      it 'returns false' do
        allow(game).to receive(:players_count).and_return(2)

        allow(game).to receive(:pass_count).and_return(3)
        expect(game.ended?).to be false
      end
    end
  end
end

