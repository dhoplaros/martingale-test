require_relative '../../lib/martingale'

RSpec.describe Martingale do
  context 'when calling next_run_won?' do
    it 'should return a boolean value' do
      expect(Martingale.next_run_won?).to be(true).or be(false)
    end

    it 'should return a boolean value for non american_roulette' do
      expect(Martingale.next_run_won?(american_roulette: false)).to be(true).or be(false)
    end
  end
end
