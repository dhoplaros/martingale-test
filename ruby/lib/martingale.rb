module Martingale
  AMERICAN_POSSIBLE_VALUES = 38
  FRENCH_POSSIBLE_VALUES = 37

  # Assuming that 17 values win 0-17
  def next_run_won?(possible_values: AMERICAN_POSSIBLE_VALUES)
    rand(possible_values) < 18
  end

  def run_a_course(initial_bet: 1, initial_cash: 500, possible_values: AMERICAN_POSSIBLE_VALUES, max_rounds: 500)
    current_round = 1
    current_bet = initial_bet
    cash_in_hand = initial_cash
    max_cash = cash_in_hand
    max_bet = initial_bet
    best_round_to_stop = current_round

    max_rounds.times do |n|
      current_round = n
      break if current_bet > cash_in_hand

      max_bet = current_bet if current_bet > max_bet

      if next_run_won?(possible_values: possible_values)
        cash_in_hand += current_bet
        current_bet = initial_bet
        if cash_in_hand > max_cash
          max_cash = cash_in_hand
          best_round_to_stop = current_round
        end
      else
        cash_in_hand -= current_bet
        current_bet *= 2
      end
    end

    { initial_cash: initial_cash,
      initial_bet: initial_bet,
      cash_in_hand: cash_in_hand,
      next_bet: current_bet,
      bet_rounds: current_round,
      max_bet: max_bet,
      max_cash: max_cash,
      best_round_to_stop: best_round_to_stop,
      bust: current_bet > cash_in_hand }
  end

  def run_tests(initial_bet: 1, initial_cash: 500, possible_values: AMERICAN_POSSIBLE_VALUES, max_rounds: 500, number_of_runs: 500, output_file: 'out.csv')
    f = File.new(output_file, 'w')
    f.write("Rounds,Cash in hand,Next bet,Max bet,Max Cash,Best round to stop,Bust?\n")
    number_of_runs.times do
      result = run_a_course(initial_bet: initial_bet, initial_cash: initial_cash, possible_values: possible_values, max_rounds: max_rounds)
      f.write("#{result[:bet_rounds]},#{result[:cash_in_hand]},#{result[:next_bet]},#{result[:max_bet]},#{result[:max_cash]},#{result[:best_round_to_stop]},#{result[:bust]}\n")
    end
    f.close
  end
end
