require 'colorize'
require_relative 'input_validation'

SQUARE = '■'.freeze

GAME_COLOURS = {
  1 => SQUARE.colorize(:blue),
  2 => SQUARE.colorize(:green),
  3 => SQUARE.colorize(:red),
  4 => SQUARE.colorize(:yellow),
  5 => SQUARE.colorize(:brown),
  6 => SQUARE.colorize(:light_black),
}.freeze

# Checks result of answer
module CheckResults
  def check_results(maker, guesser)
    p maker, guesser
    guesser.guess.each_with_index do |_, i|
      if guesser.guess[i] == maker.secret_code[i]
        @result.push 100
        next
      elsif maker.secret_code.include?(guesser.guess[i])
        @result.push 2
        next
      else
        @result.push 0
      end
    end
    @feedback = @result
  end

  def turn_tracker
    @turns += 1
    puts "Turns: #{@turns}"
    if @turns == 12
      @turns = 0
      game_over
    end
  end
end

# Game class
class Game
  attr_accessor :guesses

  include InputValidation
  include CheckResults

  def initialize
    @player   = Player.new
    @cpu      = CPU.new
    @menu     = Menu.new
    @result   = []
    @feedback = []
    @game     = true
    @turns    = 0
  end

  def start
    @player = @menu.menu_scene(@player)

    puts ''
    puts '---'
    puts @cpu.secret_code
    puts '---'
    puts ''

    player_make  if @menu.input == 1
    player_guess if @menu.input == 2
  end

  def player_guess
    while @game == true
      @player.guessing
      check_results(@cpu, @player)
      display_results(@player)
      turn_tracker
    end
  end

  def player_make
    player_code = @player.make_code

    p player_code

    while @game == true
      puts 'cpu has to guess now...'
      @cpu.guessing(@turns, @feedback)
      check_results(@player, @cpu)
      display_results(@cpu)
      turn_tracker
      sleep(1)
    end
  end

  def display_results(guesser)
    puts 'Your guess'
    guesser.guess.each { |item| print GAME_COLOURS[item] }

    puts ''
    puts "RESULT: #{@result}"
    @result.each do |item|
      print SQUARE.colorize(:red)     if item == 100
      print SQUARE.colorize(:yellow)  if item == 2
      print SQUARE.colorize(:grey)    if item == 0
    end
    puts ''

    if @result.sum == 400
      puts 'You win!'
      @game = false
    end

    @result = []
  end

  def display_colour_blocks
    (1..6).each do |i|
      puts "#{i}: #{GAME_COLOURS[i]}"
    end
  end

  def game_over
    @game = false
    puts 'Game over!'
  end
end
