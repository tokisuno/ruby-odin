# Matching array values
arr = [1, 2]
case arr
in [1, 2] then puts :match
in [3, 4] then puts :no_match
end

# Matching types in array
arr2 = [1, 2]
case arr2
in [Integer, Integer]
  puts :match
in [String, String]
  puts :no_match
end

# Gives array length mismatch without "splat" (*)
arr3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
case arr3
in [Integer, Integer, *, 9, 10]
  puts :match
end

# Creating temp "tail" var with splat
arr4 = [1, 2, 3, 4]
case arr4
in [1, 2, *tail]
  p tail
end

# Ignoring index to look at
arr5 = [1, 2, 3, 4]
case arr5
in [_, _, 3, 4]
  puts :match
end

# Guard clause
arr6 = [1, 2]
case arr6
in [a, b] unless a == b
  puts :match
end

# Nested arrays
arr7 = [1, 2, [3, 4]]
case arr7
in [_, _, [3, 4]]
  puts :match
end

# var pattern to bind matching values to vars
arr8 = [1, 2, 3, 4, 5]
case arr8
in [1, 2, 3, a, b]
  puts a
  puts b
end

# match against both nested array and an individual part of it
case [1, 2, 3, [4, 5]]
in [1, 2, 3, [4, a] => arr]
  puts a
  puts arr
end

# when matching an array, the [] are optional on the outer array
arr9 = [1, 2, 3, 4]
case arr9
in 1, 2, 3, 4
  puts :match
end
