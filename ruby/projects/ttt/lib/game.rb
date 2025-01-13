class Game
  attr_accessor :start, :turn, :board, :all_moves

  def initialize(player1, player2)
    @player1 = player1 # initialize player1
    @player2 = player2 # initialize player2
    @start = true # game starts once class is instantiated
    @board = Board.new
    @all_moves = []
    @turn = 0 # move index to know whose turn it is
    # move = 0 = first move of the game
    # move = 1 = player2 move && move += 1
    # move = 2 = player1 move && move -= 1
  end
end
