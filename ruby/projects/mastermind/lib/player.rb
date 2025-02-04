require_relative 'input_validation'

class Player
  attr_accessor :name, :guess, :secret_code

  include InputValidation

  def initialize
    @name = ''
    @guess = []
    @secret_code = []
  end

  def make_code
    puts "#{@name}, please input your secret code."
    loop do
      @secret_code = gets.chomp.split('')

      puts @secret_code

      if input_validation(@secret_code, self, 'make') == true
        puts 'Hmm, nice code!'.colorize(:green)
        return @secret_code
      end

      puts 'OOPS, invalid input :/'
    end
  end

  def guessing
    loop do
      puts 'Enter your guess'

      @guess = gets.chomp.split('')

      if input_validation(@guess, self, 'guess') == true
        puts 'Good answer'.colorize(:green)
        return
      end

      puts 'OOPS, invalid input :/'
    end
  end
end
