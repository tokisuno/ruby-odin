class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end

  def name # Getter method
    @name
  end

  def name=(name) # Setter method
    @name = name
  end

  def self.what_am_i
    "I'm a GoodDog class!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name
sparky.name = "Spartacus"
puts sparky.name

puts GoodDog.what_am_i

fido = GoodDog.new("Fido")
puts fido.speak
