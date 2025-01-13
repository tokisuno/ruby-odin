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

while game.start == true
  if game.turn.zero? || game.turn == 1
    player1.move(game.all_moves)
    game.turn = 2
  else
    player2.move(game.all_moves)
    game.turn = 1
  end

  player1.moves.each do |arr|
    game.board.board[arr[0]][arr[1]] = 'x'
  end

  player2.moves.each do |arr|
    game.board.board[arr[0]][arr[1]] = 'o'
  end

  # system('clear') || system('cls')

  game.board.draw
end
