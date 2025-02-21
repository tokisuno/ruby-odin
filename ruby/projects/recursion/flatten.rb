# frozen_string_literal: true

# flattens an array

def flatten(arr, final = [])
  arr.each do |elem|
    if elem.is_a?(Array)
      flatten(elem, final)
    else
      final << elem
    end
  end
  final
end

arr1 = [[1, 2], [3, 4]]
arr2 = [[1, [8, 9], [3, 4]]]

p flatten(arr1)
p flatten(arr2)
