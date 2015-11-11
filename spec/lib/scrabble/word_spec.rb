require 'spec_helper'

module Scrabble
  describe Word do

    let(:word) { Word.new }

    it { expect(word).to respond_to :valid? }

    context 'when the word is part of the game dictionnary' do

      it 'returns true' do
        pending
        expect(word).to be true
      end
    end
  end
end
