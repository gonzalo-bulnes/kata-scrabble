RSpec.shared_examples 'an interactive Scrabble game' do

  describe 'exposes an interface for players to play' do

    it { expect(game).to respond_to :pass }
    it { expect(game).to respond_to :pick_tile }
    it { expect(game).to respond_to :place }
    it { expect(game).to respond_to :successive_pass_count }
    it { expect(game).to respond_to :swap_tile }
  end
end
