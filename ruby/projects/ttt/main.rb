# Modules which checks for win condititon.
# > Unsure as to whether this should be a method or if I am just confused LMAO

# Player class
class Player
  attr_reader :wins

  def initialize(name)
    @name = name
    @wins = 0
    @moves = []
  end

  def won
    @wins += 1
    puts "#{@name}: #{@wins}"
  end

  def moves(move)
    moves.push(move)
    # then check for win condition?
  end
end

# Chess board
class Board
  def initialize
    @moves = Array.new(9, '[.]')
  end

  def draw_board
    @moves.each_index do |index|
      if index.zero?
        print @moves[index.to_i]
      elsif index.to_i == 2 || index.to_i == 5
        puts @moves[index.to_i]
      else
        print @moves[index.to_i]
      end
    end
    puts ''
  end
end

# Base gameplay stuff
############################################
board = Board.new
game = true
loop = 0

puts 'Player 1, please enter your name:'
player1 = Player.new(gets.chomp)

puts 'Player 2, please enter your name:'
player2 = Player.new(gets.chomp)
############################################

# Game loop
while game
  board.draw_board

  p player1
  p player2

  player1.won if loop == 1

  return if player1.wins == 1

  loop += 1
end
