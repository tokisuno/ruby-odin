# TODO: Add win condition

# Player
require_relative 'lib/player'

# Board
require_relative 'lib/board'

# Game
require_relative 'lib/game'

puts 'Player 1, please enter your name:'
player1 = Player.new(gets.chomp)

puts 'Player 2, please enter your name:'
player2 = Player.new(gets.chomp)

game = Game.new(player1, player2)

game.play
