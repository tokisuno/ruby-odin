# Menu class
class Menu
  attr_reader :input

  def initialize
    @input = ''
  end

  def menu_scene(player)
    puts 'What is your name, challenger?'.colorize(:red)
    player.name = gets.chomp

    puts "Okay, #{player.name}, do you want to make the code..."
    puts "or guess the CPU's code?"
    puts '1: Make // 2: Guess'

    loop do
      @input = Integer(gets.chomp, exception: false)

      return player if @input.between?(1, 2) == true

      puts 'Invalid input, please try again!'
    end
  end
end
