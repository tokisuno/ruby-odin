require 'pp'

# Knight chess piece
class Knight
  attr_accessor :pos_x, :pos_y, :moves

  def initialize(pos_x, pos_y)
    @pos_x = pos_x
    @pos_y = pos_y
    @moves = []
  end
end

# Nodes that exist within chessboard
class Node
  attr_accessor :on

  def initialize
    @on = false
  end
end

# Chessboard
class ChessBoard
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) { Node.new } }
    @alt = false
  end

  def draw_board
    @board.each do |row|
      row.each_with_index do |_, idx|
        if idx.even?
          print(@alt == false ? '□' : '■')
        else
          print(@alt == false ? '■' : '□')
        end
        # puts row[idx].on
      end
      @alt = !@alt
      print "\n"
    end
  end
end

def knight_moves(obj, board)
  # for all variants of how the knight moves
  # if the coordinate in possible
  # append it to the moves array
  if board.board[obj.pos_x + 2][obj.pos_y + 1] != nil
    obj.moves.append([obj.pos_x + 2, obj.pos_y + 1])
  end
end

x = 0
y = 0

possible = [
  [x + 1, y + 2],
  [x + 2, y + 1],

  [x - 1, y - 2],
  [x - 2, y - 1],

  [x + 2, y - 1],
  [x + 1, y - 2],

  [x - 2, y + 1],
  [x - 1, y + 2]
]

board = ChessBoard.new
knight = Knight.new(0, 0)
p board.board[knight.pos_x][knight.pos_y].on = true
board.draw_board
knight_moves(knight, board)
p knight.moves
# pp board
