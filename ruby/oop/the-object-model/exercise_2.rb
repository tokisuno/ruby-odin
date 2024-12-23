module Woof
  def woof
    puts 'woof'
  end
end

class Dog
  include Woof
end

doggie = Dog.new
doggie.woof
