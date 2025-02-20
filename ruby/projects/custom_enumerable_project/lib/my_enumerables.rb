# frozen_string_literal: true

# shut up lsp
module Enumerable
  def my_find
    self.my_each do |elem|
      return elem if yield(elem)
    end
    nil
  end

  def my_each_with_index
    index = 0
    self.my_each do |elem|
      yield(elem, index)
      index += 1
    end
    self
  end

  def my_map
    arr = []
    self.my_each do |elem|
      a = yield(elem)
      arr.push(a)
    end
    arr
  end

  def my_inject(init = 1)
    val = 0
    val += 1
    self.my_each do |elem|
      val = yield(val, elem)
    end
    val -= 1
    init + val
  end

  def my_all?
    count = 0
    arr_size = self.count
    self.my_each do |elem|
      count += 1 if yield(elem)
    end
    count == arr_size
  end

  def my_select
    arr = []
    self.my_each do |elem|
      arr.push elem if yield (elem)
    end
    arr
  end

  def my_count
    count = 0
    if block_given?
      self.my_each do |elem|
        count += 1 if yield(elem)
      end
      count
    else
      self.size
    end
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_none?
    self.my_each do |elem|
      return false if yield(elem)
    end
    true
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield item
    end
    self
  end
end
