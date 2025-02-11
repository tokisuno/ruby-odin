module UIUX
  def debug
    system('clear')
    puts "WORD    | #{@word}"
    puts "GUESSES | #{@guesses}"
  end

  def display_guesses(word, used_letters)
    word.chomp.split('').each do |_|
      print '_'
    end
    puts ''
    puts "Used Letters: #{used_letters}"
  end
end

# Daughter Round class
class Round
  def initialize(word, guesses)
    @word = word
    @guesses = guesses
    @used_letters = []
  end

  include UIUX

  def begin
    debug
    display_guesses(@word, @used_letters)
  end
end

# Mother Game class
class Game
  def initialize
    @guesses = 0
    @word = ''
  end

  # Apparently has too many lines but idk how to solved that ...
  def main_menu
    puts 'would you like to load a save?'
    input = gets.chomp.chars.first.downcase
    loop do
      if input.downcase == 'y'
        load_save
        return
      elsif input.downcase == 'n'
        round_init
        return
      else
        puts "input #{input} invalid: try again"
        input = gets.chomp.chars.first.downcase
        next
      end
    end
  end

  def load_save
    puts 'Loading save!'
    # loading logic to be added here
  end

  def secret_word
    arr = []
    File.readlines('google-10000-english-no-swears.txt').each do |line|
      if line.chomp.length in (5..12) then arr.push(line) end
    end
    @word = arr.sample
  end

  def round_init
    secret_word
    r = Round.new(@word, @word.chomp.length)
    r.begin
  end
end

game = Game.new
game.main_menu
