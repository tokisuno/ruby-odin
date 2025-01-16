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

module Place
  def place_move(move, all_moves)
    @moves.push(move)
    all_moves.push(move)
  end
end

module WinConditions
  def vertical(moves)
    (1..3).each do |i|
      if moves.include? [1, i]
        if moves.include? [2, i]
          if moves.include? [3, i]
            return true
          end
        end
      end
      next
    end
    false
  end

  def horizontal(moves)
    (1..3).each do |i|
      if moves.include? [i, 1]
        if moves.include? [i, 2]
          if moves.include? [i, 3]
            return true
          end
        end
      end
      next
    end
    false
  end

  def cross(moves)
    if moves.include? [1, 1]
      if moves.include? [2, 2]
        if moves.include? [3, 3]
          return true
        end
      end
    end

    if moves.include? [3, 1]
      if moves.include? [2, 2]
        if moves.include? [1, 3]
          return true
        end
      end
    end
  end
  false
end

# Player class
class Player
  attr_accessor :moves, :wins, :win_state
  attr_reader :name, :winner

  include Valid
  include Place
  include WinConditions

  def initialize(name)
    @name = name
    @wins = 0
    @win_state = false
    @moves = []
  end

  def won
    @wins += 1
    @win_state = true
    # puts "#{@name}: #{@wins}"
    puts "#{@name} wins!"
  end

  def winner?
    puts "checking to see if #{@name} won..."
    if vertical(@moves)
      won
    end

    if horizontal(@moves)
      won
    end

    if cross(@moves)
      won
    end
  end

  def move(all_moves)
    checking = true
    puts "#{@name}, write your coordinates as x,y"
    while checking
      move = gets.chomp.split(',', 2).map(&:to_i)
      if valid(move, all_moves)
        place_move(move, all_moves)
        break
      else
        puts 'INVALID: Please try again :)'
      end
    end
  end
end
