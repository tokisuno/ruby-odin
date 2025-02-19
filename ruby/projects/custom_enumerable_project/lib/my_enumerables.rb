# frozen_string_literal: true

# shut up lsp
module Enumerable
  # Your code goes here
  def my_each_with_index(enum = 0)
    # offset the print by {enum} amnt/
    # return if block_given? == false
    # puts self.count

    # Going to eat and then ask someone about this
    # because I am so unbelievably lost right now ...

    self
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
