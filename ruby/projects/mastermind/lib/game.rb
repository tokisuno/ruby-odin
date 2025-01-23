# Push guesses into an array
# If all values in array can be turned into valid integers
#   -> Return true

# Check if input is valid
module InputValidation
  def input_validation(arr)
    arr.each_with_index do |_, i|
      Integer(arr[i], exception: false)
    end
    arr.length == 4
  end
end

# Checks result of answer
module CheckResults
  def check_results(guess, answer)
    puts guess, answer
  end
end

# Game class
class Game
  attr_accessor :guesses

  include InputValidation
  include CheckResults

  def initialize
    @player = 0
    @cpu = CPU.new
    @guesses = []
    @game = true
  end

  def play
    puts 'What is your name, challenger?'
    @player = Player.new(gets.chomp)
    while @game == true
      guess
      # display result
    end
  end

  def guess
    while 1
      puts 'Enter your guess'

      @player.guess = gets.chomp.split('')

      return if input_validation(@player.guess) == true

      puts 'OOPS, invalid input :/'
    end
  end
end
