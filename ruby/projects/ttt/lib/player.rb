module Valid
  def valid(move, all_moves)
    if move[0] >= 1 && move[0] <= 3
      if move[1] >= 1 && move[1] <= 3
        if !all_moves.include?(move)
          true
        end
      end
    else
      false
    end
  end
end

# Player class
class Player
  attr_accessor :moves, :wins
  attr_reader :name

  include Valid

  def initialize(name)
    @name = name
    @wins = 0
    @moves = []
  end

  def won
    @wins += 1
    puts "#{@name}: #{@wins}"
  end

  def move(all_moves)
    checking = true
    puts "#{@name}, write your coordinates as x,y"
    while checking
      move = gets.chomp.split(',', 2).map(&:to_i)
      if valid(move, all_moves)
        @moves.push(move) && all_moves.push(move)
        break
      else
        puts 'INVALID: Please try again :)'
      end
    end
  end
end
