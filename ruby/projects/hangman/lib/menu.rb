# Mother Game class
class Game
  # def initialize
  #   @guesses = 0
  #   @word = ''
  # end

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

  def round_init
    r = Round.new
    r.begin
  end
end
