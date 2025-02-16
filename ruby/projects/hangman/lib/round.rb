require 'json'

# Daughter Round class
class Round
  def initialize(condition)
    @word = ''
    @max_guesses = 0
    @guesses = 0
    @used_letters = []
    @underscores = []
    @game = true
    @load_state = condition
  end

  include DataManip

  def debug
    # system('clear')
    puts "WORD    | #{@word}"
    puts "GUESSES | #{@guesses}"
    puts "MAX GUESSES | #{@max_guesses}"
  end

  def valid_input(input)
    # stole from: https://stackoverflow.com/a/33267191
    chars = ('a'..'z').to_a
    if input.length == 1
      if input.chars.detect { |chr| !chars.include?(chr) }.nil?
        if !@used_letters.include?(input)
          @used_letters.push(input)
          true
        end
      end
    end
  end

  def compare_input(input)
    a = @word.split('').map.with_index { |i, pos| pos if i == input }.compact
    a.each do |pos|
      @underscores[pos.to_i] = input
    end
  end

  def begin
    if @load_state == true
      load_save
    else
      secret_word
    end
    debug
    while @game
      puts "Make your guess! (#{@guesses}/#{@max_guesses})"
      input = gets.chomp
      save_and_quit if input == 'SAVE'
      system('clear')
      if valid_input(input.downcase) == true
        compare_input(input.downcase)
        check_win
        display_underscores
        @guesses += 1
        next
      else
        puts 'Invalid input!'
      end
    end
  end

  private

  def check_win
    if @underscores.join == @word
      puts 'you win!~~'
      @game = false
    end

    @game = false if @guesses == @max_guesses
  end

  def display_underscores
    @underscores.each do |i|
      print i
    end
    puts ''
    puts "Used Letters: #{@used_letters}"
  end

  def secret_word
    arr = []
    File.readlines('data/dict/google-10000-english-no-swears.txt').each do |line|
      if line.chomp.length in (5..12) then arr.push(line) end
    end
    @word = arr.sample.chomp
    @max_guesses = @word.length + (@word.length / 2)
    @underscores = Array.new(@word.length, '_')
  end
end
