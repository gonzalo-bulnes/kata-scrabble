require 'spec_helper'

module Scrabble
  describe Game do

    let(:error) { double() }
    let(:input) { double() }
    let(:out) { double() }
    let(:game) { Game.new(error, input, out) }

    it { expect(game).to respond_to :run }

    describe '#run' do

      it 'outputs a welcome board' do
        expect(error).to receive(:puts).with(Fixtures::EMPTY_BOARD)
        game.run
      end
    end
  end
end

