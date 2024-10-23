class MyCar
  attr_accessor :colour

  attr_reader :year

  def initialize(yr, clr, mdl)
    @year = yr
    @colour = clr
    @model = mdl
    @speed = 0
  end

  def get_colour
    puts "Colour: #{@colour}"
  end

  def spray_paint(clr)
    self.colour = clr
    puts "New colour: #{clr}"
  end

  def speed
    puts @speed
  end

  def speed_up(s)
    @speed += s
    puts "You push the gas and accelerate #{s} km/h"
  end

  def break(s)
    @speed -= s
    puts "You push the break and decelerate #{s} km/h"
  end

  def shut_down
    @speed = 0
    puts "ERRRRR (car stopping noises)"
  end
end

car = MyCar.new("2002", "Red", "Toyota Tacoma")
puts car.speed
puts car.speed_up(12)
puts car.speed
car.break(2)
car.get_colour
car.spray_paint("Blue")
car.get_colour
car.year
