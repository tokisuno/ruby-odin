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

# Game class
class Game
  def initialize(player1, player2)
    @player1 = player1 # initialize player1
    @player2 = player2 # initialize player2
    @start = true # game starts once class is instantiated
    @board = Board.new
    @turn = 0 # move index to know whose turn it is
    # move = 0 = first move of the game
    # move = 1 = player2 move && move += 1
    # move = 2 = player1 move && move -= 1
  end

  def next_turn
  end
end
puts 'Player 1, please enter your name:'
player1 = Player.new(gets.chomp)

puts 'Player 2, please enter your name:'
player2 = Player.new(gets.chomp)

game = Game.new(player1, player2)
