require 'spec_helper'
require 'scrabble/cli'

module Scrabble
  describe CLI do

    let(:error) { double('error') }
    let(:input) { double('input') }
    let(:out) { double('out') }
    let(:cli) { CLI.new }

    it { expect(cli).to respond_to :start }

    describe '#start' do

      it 'outputs a welcome board' do
        expect(error).to receive(:puts).with(Fixtures::EMPTY_BOARD)
        cli.start(error, input, out)
      end
    end
  end
end

