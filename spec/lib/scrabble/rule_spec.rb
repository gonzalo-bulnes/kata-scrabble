require 'spec_helper'

module Scrabble
  describe Rule do

    let(:rule) { Rule.new('Tiles cannot be placed out of the board.') }

    it { expect(rule).to respond_to :description }

    describe '#description' do

      it 'returns a String' do
        expect(rule.description).to be_kind_of String
      end
    end
  end
end
