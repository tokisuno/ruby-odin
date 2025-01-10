# Player class
require_relative 'lib/player'

# Game and Gameboard class
require_relative 'lib/game-and-board'

puts 'Player 1, please enter your name:'
player1 = Player.new(gets.chomp)

puts 'Player 2, please enter your name:'
player2 = Player.new(gets.chomp)

game = Game.new(player1, player2)

# TODO: Input verification
# TODO: Moves show up on the board
while game.start == true
  if game.turn.zero? || game.turn == 1
    player1.move(game.all_moves)

    puts "P1 Moves: #{player1.moves}"

    game.turn = 2
  else
    player2.move(game.all_moves)

    puts "P2 Moves: #{player2.moves}"

    game.turn = 1
  end

  # system('clear') || system('cls')

  game.board.draw
end
