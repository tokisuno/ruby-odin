# Mother Game class
class Game
  # def initialize
  #   @guesses = 0
  #   @word = ''
  # end
  include DataManip

  # Apparently has too many lines but idk how to solved that ...
  def main_menu
    puts 'would you like to load a save?'
    input = gets.chomp.chars.first.downcase
    loop do
      if input.downcase == 'y'
        round_init(true)
        return
      elsif input.downcase == 'n'
        round_init(false)
        return
      else
        puts "input #{input} invalid: try again"
        input = gets.chomp.chars.first.downcase
        next
      end
    end
  end

  def round_init(condition)
    r = Round.new(condition)
    r.begin
  end
end
