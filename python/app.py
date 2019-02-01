# coding=utf-8
from python.lib.martingale import run_tests
from python.lib.options_parser import parse

if __name__ == '__main__':
    options = parse()

    print('Running Martingale tests with following parameters:')
    print(f"Initial stake: {options.initial_stake}")
    print(f"Initial cash: {options.initial_cash}")
    print(f"roulette_type: {options.roulette_type}")
    print(f"Max rounds: {options.max_rounds}")
    print(f"Number of runs: {options.number_of_runs}")
    print(f"Output to: {options.output_file if options.output_file else 'console'}")

    run_tests(initial_stake=options.initial_stake,
              initial_cash=options.initial_cash,
              roulette_type=options.roulette_type,
              max_rounds=options.max_rounds,
              number_of_runs=options.number_of_runs,
              output_file=options.output_file)
