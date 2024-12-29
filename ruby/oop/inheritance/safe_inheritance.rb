class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(colour)
    super()
    @colour = colour
  end
end

bear = Bear.new('black')
p bear
