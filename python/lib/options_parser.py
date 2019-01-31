# coding=utf-8
import argparse
import sys

from python.lib.constants import *


def parse():
    arguments_parser = argparse.ArgumentParser(description=f"Usage: {sys.argv[0]} [options]")
    arguments_parser.add_argument("--initial_stake",
                                  help=f"Initial stake to commence tests with (defaults to {DEFAULT_INITIAL_STAKE})",
                                  dest="initial_stake",
                                  type=str,
                                  required=False,
                                  default=DEFAULT_INITIAL_STAKE)
    arguments_parser.add_argument("--initial_cash",
                                  help=f"Initial cash in hand (defaults to {DEFAULT_INITIAL_CASH})",
                                  dest="initial_cash",
                                  type=int,
                                  required=False,
                                  default=DEFAULT_INITIAL_CASH)
    arguments_parser.add_argument("--roulette_type",
                                  help=f"Roulette type (AMERICAN or FRENCH; Defaults to {DEFAULT_ROULETTE_TYPE})",
                                  dest="roulette_type",
                                  choices=['AMERICAN', 'FRENCH'],
                                  type=str,
                                  required=False,
                                  default=DEFAULT_ROULETTE_TYPE)
    arguments_parser.add_argument("--max_rounds",
                                  help=f"Max rounds to test for (defaults to {DEFAULT_MAX_ROUNDS})",
                                  dest="max_rounds",
                                  type=int,
                                  required=False,
                                  default=DEFAULT_MAX_ROUNDS)
    arguments_parser.add_argument("--number_of_runs",
                                  help=f"Number of tests to run (defaults to {DEFAULT_NUMBER_OF_RUNS})",
                                  dest="number_of_runs",
                                  type=int,
                                  required=False,
                                  default=DEFAULT_NUMBER_OF_RUNS)
    arguments_parser.add_argument("--output",
                                  help="Destination output file (if not supplied, will be printed on the console)",
                                  dest="output_file",
                                  type=str,
                                  required=False,
                                  default="")
    return arguments_parser.parse_args()
