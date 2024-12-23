class GoodDog
  # creates both getter and setter methods
  attr_accessor :name, :height, :weight

  def initialize(n, w, h)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

# The initialize method gets called every time you create a new object
sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.speak
sparky.change_info('Spartacus', '12 inches', '45 lbs')
puts sparky.info
