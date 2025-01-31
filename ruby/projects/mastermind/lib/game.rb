# Push guesses into an array
# If all values in array can be turned into valid integers
#   -> Return true

require 'colorize'

# NOTE: Maybe make a method that does a pretty-print of the table?

SQUARE = '■'.freeze

GAME_COLOURS = {
  1 => SQUARE.colorize(:blue),
  2 => SQUARE.colorize(:green),
  3 => SQUARE.colorize(:red),
  4 => SQUARE.colorize(:yellow),
  5 => SQUARE.colorize(:brown),
  6 => SQUARE.colorize(:light_black)
}.freeze

# Check if input is valid
# TODO: Ensure that characters don't get by
module InputValidation
  def input_validation(arr)
    tmp_array = []
    arr.each_with_index do |_, i|
      tmp = Integer(arr[i], exception: false)

      if tmp > 6 || tmp < 1
        return false
      end

      tmp_array.push(tmp)
    end
    @player.guess = tmp_array
    arr.length == 4
  end
end

# Checks result of answer
module CheckResults
  def check_results
    @player.guess.each_with_index do |_, i|
      if @player.guess[i] == @cpu.secret_code[i]
        @result.push 100
        puts 'same spot'
        next
      end
      if @cpu.secret_code.include?(@player.guess[i])
        @result.push 2
        puts 'in the array'
        next
      end
    end
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
    @result = []
    @game = true
    @turns = 0
  end


  def play
    puts 'What is your name, challenger?'.colorize(:red)
    @player = Player.new(gets.chomp)

    display_colour_blocks

    puts @cpu.secret_code

    while @game == true
      guess
      check_results
      display_results
    end
  end

  private

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

  def display_results
    @result.each do |item|
      print SQUARE.colorize(:red) if item == 100
      print SQUARE.colorize(:grey) if item == 2
    end
    puts ''
    if @result.sum == 400
      puts 'you win!'
      @game = false
    end
    @result = []
  end


  def display_colour_blocks
    (1..6).each do |i|
      puts "#{i}: #{GAME_COLOURS[i]}"
    end
  end
end
