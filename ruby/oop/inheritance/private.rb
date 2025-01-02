class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(name, age)
    self.name = name
    self.age = age
  end

  def public_disclosure
    "#{name} in human years is #{human_years}"
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

sparky = GoodDog.new('Sparky', 4)
# sparky.human_years
p sparky.public_disclosure
