# Push guesses into an array
# If all values in array can be turned into valid integers
#   -> Return true

# Check if input is valid
module InputValidation
  def input_validation(arr)
    valid = 0

    if arr.length == 4 then false end

    arr.each do |e|
      if Integer(e) then valid += 1 end
    end

    puts valid == 4
    if valid == 4 then true end
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
      # p guess
    end
  end

  def guess
    while 1
      puts 'Enter your guess'
      @player.guess = gets.chomp.split('')
      # puts input_validation(@player.guess)
      if input_validation(@player.guess) == true then return end
    end
  end
end
