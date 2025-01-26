# Push guesses into an array
# If all values in array can be turned into valid integers
#   -> Return true

require 'colorize'

# NOTE: Maybe make a method that does a pretty-print of the table?

# Check if input is valid
# TODO: Ensure that characters don't get by
module InputValidation
  def input_validation(arr)
    tmp_array = []
    arr.each_with_index do |_, i|
      tmp = Integer(arr[i], exception: false)
      return false if tmp > 6 || tmp < 1
      tmp_array.push(tmp)
    end
    @player.guess = tmp_array
    arr.length == 4
  end
end

# Checks result of answer
module CheckResults
  CORRECT = '▣'.freeze
  CLOSE   = '▧'.freeze
  # def check_results
  #   p @player.guess
  #   p @cpu.secret_code
  #   @cpu.secret_code.each_with_index do |_, i|
  #     if @cpu.secret_code[i] == @player.guess[i]
  #       @guesses[i] = CORRECT
  #       next
  #     end
  #
  #     if @cpu.secret_code[i] != CORRECT
  #       if @cpu.secret_code.include? @player.guess[i]
  #         @guesses[@player.guess[@player.guess.index(@player.guess[i])]] = CLOSE
  #         next
  #       end
  #     end
  #   end
  #   print @guesses
  #   @guesses = ['□', '□', '□', '□']
  # end
end

# Game class
class Game
  attr_accessor :guesses

  include InputValidation
  include CheckResults

  def initialize
    @player = 0
    @cpu = CPU.new
    # @guesses = ['□', '□', '□', '□']
    @game = true
    @turns = 0
  end

  def play
    puts 'What is your name, challenger?'.colorize(:red)
    @player = Player.new(gets.chomp)

    puts @cpu.secret_code

    while @game == true
      guess
      # check_results
      # @turns += 1
      # puts @turns
    end
  end

  def guess
    while 1
      puts 'Enter your guess'

      @player.guess = gets.chomp.split('')

      if input_validation(@player.guess) == true
        puts 'Good answer'.colorize(:green)
        return
      end

      puts 'OOPS, invalid input :/'
    end
  end
end
