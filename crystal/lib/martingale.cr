module Martingale
  # Defaults
  DEFAULT_INITIAL_STAKE     =   1
  DEFAULT_INITIAL_CASH      = 500
  DEFAULT_MAX_ROUNDS        = 500
  DEFAULT_NUMBER_OF_RUNS    =  10
  DEFAULT_AMERICAN_ROULETTE = true

  AMERICAN_POSSIBLE_VALUES = 38
  FRENCH_POSSIBLE_VALUES   = 37

  # Assuming that 17 values win 0-17
  def self.next_run_won?(american_roulette = true)
    rand(american_roulette ? AMERICAN_POSSIBLE_VALUES : FRENCH_POSSIBLE_VALUES) < 18
  end

  def self.run_a_course(initial_stake = DEFAULT_INITIAL_STAKE,
                        initial_cash = DEFAULT_INITIAL_CASH,
                        american_roulette = DEFAULT_AMERICAN_ROULETTE,
                        max_rounds = DEFAULT_MAX_ROUNDS)
    current_round = 1
    current_stake = initial_stake
    cash_in_hand = initial_cash
    max_cash = cash_in_hand
    max_stake = initial_stake
    best_round_to_stop = current_round

    max_rounds.times do |n|
      current_round = n
      break if current_stake > cash_in_hand

      max_stake = current_stake if current_stake > max_stake

      if next_run_won?(american_roulette)
        cash_in_hand += current_stake
        current_stake = initial_stake
        if cash_in_hand > max_cash
          max_cash = cash_in_hand
          best_round_to_stop = current_round
        end
      else
        cash_in_hand -= current_stake
        current_stake *= 2
      end
    end

    {initial_cash:       initial_cash,
     initial_stake:      initial_stake,
     cash_in_hand:       cash_in_hand,
     next_stake:         current_stake,
     bet_rounds:         current_round,
     max_stake:          max_stake,
     max_cash:           max_cash,
     best_round_to_stop: best_round_to_stop,
     bust:               current_stake > cash_in_hand}
  end

  def self.run_tests(initial_stake = DEFAULT_INITIAL_STAKE,
                     initial_cash = DEFAULT_INITIAL_CASH,
                     american_roulette = DEFAULT_AMERICAN_ROULETTE,
                     max_rounds = DEFAULT_MAX_ROUNDS,
                     number_of_runs = DEFAULT_NUMBER_OF_RUNS,
                     output_file = "out.csv")
    if output_file
      f = File.new(output_file, 'w')
      f.puts("Rounds,Cash in hand,Next Stake,Max Stake,Max Cash,Best round to stop,Bust?")
    else
      puts
      puts "Rounds,Cash in hand,Next Stake,Max Stake,Max Cash,Best round to stop,Bust?"
      puts
    end
    number_of_runs.times do
      result = run_a_course(initial_stake: initial_stake, initial_cash: initial_cash, american_roulette: american_roulette, max_rounds: max_rounds)
      result_output = "#{result[:bet_rounds]},#{result[:cash_in_hand]},#{result[:next_stake]},#{result[:max_stake]},#{result[:max_cash]},#{result[:best_round_to_stop]},#{result[:bust]}"
      # if output_file
        # f.puts(result_output)
      # else
        puts result_output
      # end
    end
    # f.close if output_file
  end
end
