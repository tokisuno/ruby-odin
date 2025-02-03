require_relative 'input_validation'

class Player
  attr_accessor :name, :guess

  include InputValidation

  def initialize
    @name = ''
    @guess = []
    @secret_code = ''
  end

  def make_code
    puts "#{@name}, please input your secret code."
    loop do
      @secret_code = gets.chomp.split('')
      puts @secret_code

      if input_validation(@secret_code, self) == true
        puts 'Hmm, nice code!'.colorize(:green)
        return
      end

      puts 'OOPS, invalid input :/'
    end
  end
end
