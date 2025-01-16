class Game
  attr_accessor :start, :board, :all_moves

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
        if @all_moves.length >= 5 then @player1.winner? end
        @player1.moves.each do |arr|
          @board.board[arr[0]][arr[1]] = 'x'
        end
        @turn = 2
      else
        @player2.move(@all_moves)
        if @all_moves.length >= 5 then @player2.winner? end
        @player2.moves.each do |arr|
          @board.board[arr[0]][arr[1]] = 'o'
        end
        @turn = 1
      end

      # puts "#{@player1.win_state} // #{@player2.win_state}"

      if @player1.win_state == true then return end
      if @player2.win_state == true then return end

      system('clear') || system('cls')

      @board.draw
    end
  end
end
