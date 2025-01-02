module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end

module Conversions
  def self.farenheit_to_celcius(num)
    (num - 32) * 5 / 9
  end
end

buddy = Mammal::Dog.new
kitty = Mammal::Cat.new

buddy.speak('Arf!')
kitty.say_name('kitty')

value = Conversions.farenheit_to_celcius(32)
p value
