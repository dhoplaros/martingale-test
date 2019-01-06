require 'optparse'
require './lib/martingale'

module Martingale
  Options = Struct.new(:initial_stake, :initial_cash, :american_roulette, :max_rounds, :number_of_runs, :output_file)

  class Parser
    def self.parse(options)
      args = Options.new(DEFAULT_INITIAL_STAKE, DEFAULT_INITIAL_CASH, DEFAULT_AMERICAN_ROULETTE, DEFAULT_MAX_ROUNDS, DEFAULT_NUMBER_OF_RUNS, nil)

      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: #{$PROGRAM_NAME} [options]"

        opts.on('-i INITIAL_STAKE', '--initial_stake=INITIAL_STAKE', "Initial stake to commence tests with (defaults to #{DEFAULT_INITIAL_STAKE})", Integer) do |n|
          args.initial_stake = n
        end

        opts.on('-c INITIAL_CASH', '--initial_cash=INITIAL_CASH', "Initial cash in hand (defaults to #{DEFAULT_INITIAL_CASH})", Integer) do |n|
          args.initial_cash = n
        end

        opts.on('-r AMERICAN', '--roulette_type=AMERICAN', 'Roulette type (AMERICAN or FRENCH; Defaults to AMERICAN)') do |n|
          args.american_roulette = n.casecmp('AMERICAN').zero?
        end

        opts.on('-m MAX_ROUNDS', '--max_rounds=MAX_ROUNDS', "Max rounds to test for (defaults to #{DEFAULT_MAX_ROUNDS})", Integer) do |n|
          args.max_rounds = n
        end

        opts.on('-n NUMBER_OF_RUNS', '--number_of_runs=NUMBER_OF_RUNS', "Number of tests to run (defaults to #{DEFAULT_NUMBER_OF_RUNS})", Integer) do |n|
          args.number_of_runs = n
        end

        opts.on('-o OUTPUT_FILE', '--output=OUTPUT_FILE', 'Destination output file (if not supplied, will be printed on the console)') do |n|
          args.output_file = n
        end

        opts.on('-h', '--help', 'Prints this help') do
          puts opts
          exit
        end
      end

      opt_parser.parse!(options)
      args
    end
  end
end
