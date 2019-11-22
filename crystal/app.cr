require "./lib/martingale"

Martingale.run_tests(
  initial_stake: 1,
  initial_cash: 500,
  american_roulette: true,
  max_rounds: 500,
  number_of_runs: 10,
  output_file: nil
)
