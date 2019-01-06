# martingale-test

Testing Roulette's [Martingale System](https://en.wikipedia.org/wiki/Martingale_(betting_system))

The aim of this project is to be a personal exercise in various programming languages. The implementations should be simple and self explanatory.

Assuming console applications; The parameters should be command line arguments, and the output should either be a CSV file or printed to the console.

## Inputs
- Initial stake: the minimum bet for the test (defaults to 1)
- Initial cash: the available funds (defaults to 500)
- Max number of bets: the maximum number of bets the test should run for (defaults to 500)
- American?: Flag indicating whether using American (inclusion of double zero value) roulette or not (defaults to true)

## Output
Along with the original input for the test, the following should also be output:
- Cash in hand: remaining funds after completion of tests
- Next stake: what the next stake would had been had it taken place (e.g. in the event of going bust, or reaching max number of bets)
- Bet rounds: the number of rounds the test went for (e.g. it could be less than supplied maximum if the player went bust)
- Best round to stop: the best round the player should had stopped at (maximum cash in hand)
- Max cash: the maximum cash the player had at any given round during the test
- Bust?: flag indicating whether the player went bust or not (had available cash for the next stake or not)

## Assumptions
- Assuming a fair roulette; i.e. the ball may land on any number with equal probability
- This should not be a roulette simulator; the results should be purely based on the theoretical probabilities of a ball landing on a number. No ball weight or speed or direction is meant to be simulated
