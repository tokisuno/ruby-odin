class CPU
  attr_accessor :guess, :secret_code

  def initialize
    # 6 items, each will be randomized with values between 1-6
    @name = 'CPU'
    @secret_code = Array.new(4) { rand(1..6) }
    @guess = []
    @past_guess = Array.new(4) { 0 }
  end

  def new_code
    @secret_code.each_with_index do |_, index|
      @secret_code[index] = rand(1..6)
    end
  end

  def guessing(turns, feedback)
    @past_guess = @guess
    @guess = Array.new(4) { 0 }
    # candidates    = Array.new(4) { 0 }
    # possibilities = [1, 2, 3, 4, 5, 6]
    p "Feedback: #{feedback}"

    @guess = [0, 0, 0, 0] if turns.zero?

    feedback.each_with_index do |_, i|
      @guess[i] = @past_guess[i] if feedback[i] == 100
      @guess[i] = @past_guess[i] + 1 if feedback[i] != 100
    end

    turns + 1
  end
end
