require 'spec_helper'

module Scrabble
  describe Board::Location do

    let(:word) { Board::Location.new }

    it { expect(word).to respond_to :correct? }
  end
end
