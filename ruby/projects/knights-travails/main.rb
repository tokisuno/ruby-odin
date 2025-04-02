# pretty printing
require 'pp'

# require binary search tree module
# require_relative 'bst'

# Graph's node
class GraphNode
  attr_accessor :value, neighbours

  def initialize(value)
    @value = value
    @neighbours = []
  end

  def add_edge(neighbour)
    @neighbours << neighbour
  end
end

# The graph
class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def add_node(value)
    @nodes << GraphNode.new(value)
  end
end

# init board
board = Array.new(8) { Array.new(8) { 0 } }

# all the movement possibilities of the knight
def valid(pos)
  [
    [pos[0] + 1, pos[1] + 2],
    [pos[0] + 2, pos[1] + 1],

    [pos[0] - 1, pos[1] - 2],
    [pos[0] - 2, pos[1] - 1],

    [pos[0] + 2, pos[1] - 1],
    [pos[0] + 1, pos[1] - 2],

    [pos[0] - 2, pos[1] + 1],
    [pos[0] - 1, pos[1] + 2]
  ]
end

# finding the possible moves current pos
def possible_moves(pos)
  res = []

  possible = valid(pos)

  possible.each do |move|
    res.push(possible?(move)) if possible?(move)
    next
  end

  res
end

def possible?(alg)
  return alg if alg[0] >= 0 && alg[1] >= 0

  false
end

# find the knight moves requires
def knight_moves(start, final = [], board)
  puts "#{start} :: #{final}"

  # board[start[0]][start[1]] = 1
end

knight_moves([0, 0], [3, 3], board)

# pp board
