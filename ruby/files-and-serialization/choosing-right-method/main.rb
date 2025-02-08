# require 'yaml'
require 'json'
# require 'msgpack'


# i don't see what the point of the last example was ...
module BasicSerializable
  @@serializer = JSON


  def serialize
    obj = {}
    instance_variables.map do |var|
      obj[var] = instance_variable_get(var)
    end

    @@serializer.dump obj
  end

  def unserialize(string)
    obj = @@serializer.parse(string)
    obj.keys.each do |key|
      instance_variable_set(key, obj[key])
    end
  end
end

class Person
  include BasicSerializable

  attr_accessor :persons

  def initialize
    @persons = []
  end

  def serialize
    obj = @persons.map do |person|
      person.serialize
    end

    @@serializer.dump obj
  end

  def unserialize(string)
    obj = @@serializer.parse string
    @persons = []

    obj.each do |person_string|
      person = Person.new "", 0, ""
      person.unserialize(person_string)
      @persons << person
    end
  end

  def <<(person)
    @persons << person
  end
end

person = Person.new
p person.serialize

person.unserialize(person.serialize)
puts "Name #{person.name}"
puts "Age #{person.age}"
puts "Gender #{person.gender}"
