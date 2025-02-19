# frozen_string_literal: true

arr = [1, 2, 3]

# this is a class
class Array
  def my_each
    for i in self
      yield i
    end
  end
end

arr.my_each { |item| puts item + 1 }
