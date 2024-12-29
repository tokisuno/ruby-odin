class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(colour)
    super
    @colour = colour
  end
end

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

class Cat < Animal
end

sparky = GoodDog.new('brown')
p sparky

bear = BadDog.new(2, 'bear')
p bear
