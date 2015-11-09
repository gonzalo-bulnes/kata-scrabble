require 'spec_helper'

module Scrabble
  describe Rule do

    let(:rule) { Rule.new('Tiles cannot be placed out of the board.') }

    it { expect(rule).to respond_to :error_message }

    describe '#error_message' do

      it 'returns a String' do
        expect(rule.error_message).to be_kind_of String
      end
    end
  end
end
