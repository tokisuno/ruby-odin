# Mastermind
# - Guess your opponent's secret code with a certain number of turns
# - Basically like colour combination wordle?
require './lib/cpu'
require './lib/player'
require './lib/game'
require './lib/menu'

game = Game.new
game.start
