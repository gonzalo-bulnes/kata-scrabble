require 'spec_helper'

module Scrabble
  describe Game do

    let(:error) { double() }
    let(:input) { double() }
    let(:out) { double() }
    let(:game) { Game.new(error, input, out) }

    it { expect(game).to respond_to :run }

    it_behaves_like 'an interactive Scrabble game'

    describe '#run' do

      it 'outputs a welcome board' do
        expect(error).to receive(:puts).with(Fixtures::EMPTY_BOARD)
        game.run
      end
    end

    describe '#pass' do

      it 'increments the successive_pass_count' do
        expect{ game.pass }.to change{ game.successive_pass_count }.by(1)
      end
    end

    describe '#pick_tile' do

      it 'returns a Tile' do
        expect(game.pick_tile).to be_kind_of Tile
      end

      context 'when the tiles bag is empty' do

        it 'returns nil' do
          pending
          allow(game.send(:bag)).to receive(:empty?).and_return(true)
          expect(game.pick_tile).to be_nil
        end
      end
    end

    describe '#place' do

      context 'when the word is valid and the location correct' do

        it 'returns a Fixnum' do
          pending
          word = instance_double("Word")
          location = instance_double("Board::Location")
          allow(word).to receive(:valid?).and_return(true)
          allow(location). to receive(:correct?).and_return(true)
          expect(game.place(word, location)).to be_kind_of Fixnum
        end
      end
    end

    describe '#swap_tile' do

      let(:tileA) { instance_double("Tile") }
      let(:tileB) { instance_double("Tile") }

      before(:each) do
        allow(game).to receive(:bag).and_return([tileA])
      end

      it 'returns a Tile' do
        expect(game.swap_tile(tileA)).to be_kind_of Tile
      end

      it 'adds the provided tile to the bag' do
        pending
        expect{ game.swap_tile(tileA) }.not_to change{ game.send(:bag).size }
        expect(game.send(:bag)).to include?(tileA)
      end

      context 'when the tiles bag is empty' do

        it 'returns nil' do
          pending
          allow(game).to receive(:bag).and_return([])
          expect(game.swap_tile(tileA)).to be_nil
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
        pending
        expect(game.send(:remaining_tiles)).to be_kind_of Array
        expect(game.send(:remaining_tiles)).not_to be_empty
        expect(game.send(:remaining_tiles)[0]).to be_kind_of Tile
      end
    end

    describe '#successive_pass_count', private: true do

      it 'gets incremented when a player passes' do
        pending
        expect().to change(successive_pass_count).by(1)
      end

      it 'gets reset when a player does not pass' do
        pending
        expect().to change(successive_pass_count).to(0)
      end
    end
  end
end

