require "option_parser"
require "./martingale.cr"

module Martingale
  # Options = Struct(:initial_stake, :initial_cash, :american_roulette, :max_rounds, :number_of_runs, :output_file)

  class Parser
    def self.parse(options)
      args = {
        :initial_stake     => DEFAULT_INITIAL_STAKE,
        :initial_cash      => DEFAULT_INITIAL_CASH,
        :american_roulette => DEFAULT_AMERICAN_ROULETTE,
        :max_rounds        => DEFAULT_MAX_ROUNDS,
        :number_of_runs    => DEFAULT_NUMBER_OF_RUNS,
        :output_file       => nil,
      }

      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: #{::PROGRAM_NAME} [options]"

        opts.on("-i INITIAL_STAKE", "--initial_stake=INITIAL_STAKE", "Initial stake to commence tests with (defaults to #{DEFAULT_INITIAL_STAKE})") do |n|
          args[:initial_stake] = n.to_i
        end

        opts.on("-c INITIAL_CASH", "--initial_cash=INITIAL_CASH", "Initial cash in hand (defaults to #{DEFAULT_INITIAL_CASH})") do |n|
          args[:initial_cash] = n.to_i
        end

        opts.on("-r AMERICAN", "--roulette_type=AMERICAN", "Roulette type (AMERICAN or FRENCH; Defaults to AMERICAN)") do |n|
          args[:american_roulette] = n.compare("AMERICAN", true).zero?
        end

        opts.on("-m MAX_ROUNDS", "--max_rounds=MAX_ROUNDS", "Max rounds to test for (defaults to #{DEFAULT_MAX_ROUNDS})") do |n|
          args[:max_rounds] = n.to_i
        end

        opts.on("-n NUMBER_OF_RUNS", "--number_of_runs=NUMBER_OF_RUNS", "Number of tests to run (defaults to #{DEFAULT_NUMBER_OF_RUNS})") do |n|
          args[:number_of_runs] = n.to_i
        end

        opts.on("-o OUTPUT_FILE", "--output=OUTPUT_FILE", "Destination output file (if not supplied, will be printed on the console)") do |n|
          # args.output_file = n
        end

        opts.on("-h", "--help", "Prints this help") do
          puts opts
          exit
        end
      end

      opt_parser.parse(options)

      
      args
    end
  end
end
