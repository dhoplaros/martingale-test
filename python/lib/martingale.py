# coding=utf-8
import random

from python.lib.constants import *


def next_run_won(american_roulette: bool) -> bool:
    possible_values = FRENCH_POSSIBLE_VALUES
    if american_roulette:
        possible_values = AMERICAN_POSSIBLE_VALUES
    return random.randint(0, possible_values) > 18  # Assuming that 17 values win


def run_course(initial_stake: int,
               initial_cash: int,
               american_roulette: bool,
               max_rounds: int) -> dict:
    current_round = 1
    current_stake = initial_stake
    max_stake = initial_stake
    cash_in_hand = initial_cash
    max_cash = initial_cash
    best_round_to_stop = current_round

    for n in range(max_rounds):
        current_round = n
        if current_stake > cash_in_hand:
            break
        if current_stake > max_stake:
            max_stake = current_stake
        if next_run_won(american_roulette):
            cash_in_hand += current_stake
            current_stake = initial_stake
            if cash_in_hand > max_cash:
                max_cash = cash_in_hand
                best_round_to_stop = current_round
            else:
                cash_in_hand -= current_stake
                current_stake *= 2

    return {'initial_cash': initial_cash,
            'initial_stake': initial_stake,
            'cash_in_hand': cash_in_hand,
            'next_stake': current_stake,
            'bet_rounds': current_round,
            'max_stake': max_stake,
            'max_cash': max_cash,
            'best_round_to_stop': best_round_to_stop,
            'bust': current_stake > cash_in_hand}


def run_tests(initial_stake: int = DEFAULT_INITIAL_STAKE,
              initial_cash: int = DEFAULT_INITIAL_CASH,
              roulette_type: str = DEFAULT_ROULETTE_TYPE,
              max_rounds: int = DEFAULT_MAX_ROUNDS,
              number_of_runs: int = DEFAULT_NUMBER_OF_RUNS,
              output_file: str = 'out.csv'):
    result_format = '{0:d},{1:d},{2:d},{3:d},{4:d},{5:d},{6:d}\n'
    output = 'Rounds,Cash in hand,Next Stake,Max Stake,Max Cash,Best round to stop,Bust?\n'
    for n in range(number_of_runs):
        result = run_course(initial_stake, initial_cash, roulette_type == 'AMERICAN', max_rounds)
        output += result_format.format(result['bet_rounds'],
                                       result['cash_in_hand'],
                                       result['next_stake'],
                                       result['max_stake'],
                                       result['max_cash'],
                                       result['best_round_to_stop'],
                                       result['bust'])
    if output_file:
        f = open(output_file, 'w+')
        f.write(output)
        f.close()
        return
    print(output)
