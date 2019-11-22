require "./lib/martingale"
require "./lib/options_parser"

options = Martingale::Parser.parse ARGV

puts "Running Martingale tests with following parameters:"
puts "Initial stake: #{options[:initial_stake]}"
puts "Initial cash: #{options[:initial_cash]}"
puts "roulette_type: #{options[:american_roulette] ? "AMERICAN" : "FRENCH"}"
puts "Max rounds: #{options[:max_rounds]}"
puts "Number of runs: #{options[:number_of_runs]}"
puts "Output to: #{options[:output_file] || "console"}"
puts

puts options[:initial_stake].class
puts options[:initial_cash].class
puts options[:american_roulette].class
puts options[:max_rounds].class
puts options[:number_of_runs].class

Martingale.run_tests(
  initial_stake: options[:initial_stake],
  initial_cash: options[:initial_cash],
  american_roulette: options[:american_roulette],
  max_rounds: options[:max_rounds],
  number_of_runs: options[:number_of_runs],
  output_file: nil
)
