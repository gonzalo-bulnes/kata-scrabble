require 'spec_helper'

module Scrabble
  describe Game do

    let(:error) { double() }
    let(:input) { double() }
    let(:out) { double() }
    let(:game) { Game.new(error, input, out) }

    it { expect(game).to respond_to :run }

    describe '#run' do

      it 'outputs "Hello!"' do
        expect(error).to receive(:puts).with('Hello!')
        game.run
      end
    end
  end
end

