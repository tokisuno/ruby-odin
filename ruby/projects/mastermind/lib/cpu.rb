class CPU
  attr_accessor :guess, :secret_code

  def initialize
    # 6 items, each will be randomized with values between 1-6
    @name = 'CPU'
    @secret_code = Array.new(4) { rand(1..6) }
    @guess = []
  end

  def new_code
    @secret_code.each_with_index do |_, index|
      @secret_code[index] = rand(1..6)
    end
  end

  def guessing
    @guess = new_code
    sleep(1)
  end
end
