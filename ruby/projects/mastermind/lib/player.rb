class Player
  attr_accessor :name, :guess

  def initialize(name)
    @name = name
    @guess = []
    @secret_code = ''
  end
end
