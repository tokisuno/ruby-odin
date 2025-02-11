class Game
  def initialize(player_name)
    @player_name = player_name
    @guessing = true
    @guesses = 0
    @word = ''
  end

  def main_menu
    puts 'would you like to load a save?'
    input = gets.chomp.chars.first.downcase
    loop do
      if input.downcase == 'y'
        load_save
        return
      elsif input.downcase == 'n'
        start_game
        return
      else
        puts "input #{input} invalid: try again"
        input = gets.chomp.chars.first.downcase
        next
      end
    end
  end

  def start_game
    secret_word
    puts @word
    puts @guesses
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
    @guesses = @word.chomp.length
  end
end

game = Game.new('lucas')
game.main_menu
