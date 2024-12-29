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
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
lumina.current_speed

lumina.colour = 'black'
puts lumina.colour
puts lumina.year

lumina.spray_paint('red')
