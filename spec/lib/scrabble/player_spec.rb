require 'spec_helper'

module Scrabble
  describe Player do

    let(:player) { Player.new('Alice') }

    it { expect(player).to respond_to :name }

    describe '#name' do

      it 'returns a String' do
        expect(player.name).to be_kind_of String
      end
    end
  end
end
