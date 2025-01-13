class Board
  attr_accessor :board

  def initialize
    @board = [
      ['-', '1', '2', '3'],
      ['1', '.', '.', '.'],
      ['2', '.', '.', '.'],
      ['3', '.', '.', '.']
    ]
  end

  def draw
    puts @board.map { |x| x.join(' ') }
  end
end
