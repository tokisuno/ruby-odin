module CheckWinner
  def check_winner
    puts 'this checks who won'
  end
end


class Game
  attr_accessor :start, :board, :all_moves

  include CheckWinner

  def initialize(player1, player2)
    @player1 = player1 # initialize player1
    @player2 = player2 # initialize player2
    @start = true # game starts once class is instantiated
    @board = Board.new
    @all_moves = []
    @turn = 0 # move index to know whose turn it is
  end

  def play
    while @start == true
      if @turn.zero? || @turn == 1
        @player1.move(@all_moves)
        @turn = 2
      else
        @player2.move(@all_moves)
        @turn = 1
      end

      @player1.moves.each do |arr|
        @board.board[arr[0]][arr[1]] = 'x'
      end

      @player2.moves.each do |arr|
        @board.board[arr[0]][arr[1]] = 'o'
      end

      if all_moves.length >= 5 then check_winner() end

      # system('clear') || system('cls')

      @board.draw
    end
  end
end
