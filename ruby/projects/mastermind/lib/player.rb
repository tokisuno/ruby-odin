class Player
  attr_accessor :name, :guess

  def initialize(name)
    @name = name
    @guess = []
  end
end
