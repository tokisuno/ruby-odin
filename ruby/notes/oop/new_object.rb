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
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.get_name
sparky.set_name = "Spartacus"
puts sparky.get_name

fido = GoodDog.new("Fido")
puts fido.speak
