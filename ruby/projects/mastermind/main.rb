# Mastermind
# - Guess your opponent's secret code with a certain number of turns
# - Basically like colour combination wordle?
require './lib/cpu'
require './lib/player'
require './lib/menu'
require './lib/game'

game = Game.new
game.play
