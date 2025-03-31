require 'pp'
# all the movement possibilities of the knight

# Gets the possible moves from the current position
def possible_moves(pos)
  res = []

  possible = [
    [pos[0] + 1, pos[1] + 2],
    [pos[0] + 2, pos[1] + 1],

    [pos[0] - 1, pos[1] - 2],
    [pos[0] - 2, pos[1] - 1],

    [pos[0] + 2, pos[1] - 1],
    [pos[0] + 1, pos[1] - 2],

    [pos[0] - 2, pos[1] + 1],
    [pos[0] - 1, pos[1] + 2]
  ]

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

board = Array.new(8) { Array.new(8) { 0 } }

# find the knight moves requires
def knight_moves(start = [], final = [], board)
  puts "#{start} :: #{final}"

  # pp board[start[0]][start[1]]
  # puts start[0]

  board[start[0]][start[1]] = 1
end

knight_moves([0, 0], [3, 3], board)

pp possible_moves([0, 0])

# pp board
