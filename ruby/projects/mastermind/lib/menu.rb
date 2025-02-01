# Menu class
class Menu
  attr_reader :input

  def initialize
    @menu = true
    @input = ''
  end

  def menu_scene
    while @menu == true
      puts 'Do you want to make the code...'
      puts "or guess the CPU's code?"
      puts '1: Make // 2: Guess'

      loop do
        @input = Integer(gets.chomp, exception: false)
        return if @input.between?(1, 2) == true

        puts 'Invalid input, please try again!'
      end
    end
  end
end
