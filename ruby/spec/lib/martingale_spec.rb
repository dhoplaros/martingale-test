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

  context 'when calling run_a_course' do
    it 'should return a valid result' do
      expect(Martingale.run_a_course).to match(a_hash_including(
          initial_cash: be_kind_of(Numeric),
          initial_stake: be_kind_of(Numeric),
          cash_in_hand: be_kind_of(Numeric),
          next_stake: be_kind_of(Numeric),
          bet_rounds: be_kind_of(Integer),
          max_stake: be_kind_of(Numeric),
          max_cash: be_kind_of(Numeric),
          best_round_to_stop: be_kind_of(Integer),
          bust: (be(true).or be(false))
        )
      )
    end

    it 'should return a valid result for non integer initial_stake' do
      expect(Martingale.run_a_course(initial_stake: 1.35)).to match(a_hash_including(
          initial_cash: be_kind_of(Numeric),
          initial_stake: be_kind_of(Numeric),
          cash_in_hand: be_kind_of(Numeric),
          next_stake: be_kind_of(Numeric),
          bet_rounds: be_kind_of(Integer),
          max_stake: be_kind_of(Numeric),
          max_cash: be_kind_of(Numeric),
          best_round_to_stop: be_kind_of(Integer),
          bust: (be(true).or be(false))
        )
      )
    end
  end
end
