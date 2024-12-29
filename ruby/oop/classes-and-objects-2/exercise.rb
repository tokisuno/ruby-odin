class MyCar
  attr_accessor :colour, :model
  attr_reader :year, :speed

  def initialize(year, colour, model)
    @year = year
    @colour = colour
    @model = model
    @speed = 0
  end

  def speed_up(input)
    @speed += input
    puts "You push the gas and accelerate #{input} km/h."
  end

  def brake(input)
    @speed -= input
    puts "You push the break and decelerate #{input} km/h."
  end

  def current_speed
    puts "You are going #{@speed} km/h."
  end

  def shut_down
    @speed = 0
    puts "Let's park!"
  end

  def spray_paint(colour)
    self.colour = colour
    puts "Your new #{colour} paint job looks great!"
  end

  def gas_mileage(miles, gallons)
    puts "Your mileage is #{miles / gallons}"
  end

  def to_s
    "Model: #{@model}\nColour: #{@colour}\nYear: #{@year}\n "
  end
end

lumina = MyCar.new(1997, 'white', 'chevy lumina')
puts lumina
lumina.gas_mileage(13, 351)
