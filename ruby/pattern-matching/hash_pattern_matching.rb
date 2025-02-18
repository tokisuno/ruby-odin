my_hash = {
  a: 'apple',
  b: 'banana',
  c: 'cat'
}
# compare values in hash
case my_hash
in { a: 'aardvark', b: 'bat' }
  puts :no_match
in { a: 'apple', b: 'banana' }
  puts :match
end

# match against hash and assign values to variables
case my_hash
in { a: a, b: b }
  puts a
  puts b
end

# syntactic sugar for above
case my_hash
in { a:, b: }
  puts a
  puts b
end

# like with arrays, you can omit parens
case my_hash
in a:, b:
  puts a
  puts b
end

# double splat ** to scoop up multiple k,v pairs
my_new_hash = { a: 'ant', b: 'ball', c: 'cat' }
case my_new_hash
in { a: 'ant', **rest }
  p rest
end

# hash will match with only a subset of keys matching
# ... therefore you have to guard against conditions where you don't want that
my_new_new_hash = { a: 'ant', b: 'ball' }
case my_new_new_hash
in { a: 'ant' }
  puts 'this is a match'
in { a: 'ant', b: 'ball' }
  puts 'this will never be reached'
end

# to ensure you can only match exactly
case my_new_new_hash
in { a: 'ant', **nil }
  puts :no_match
in { a: 'ant', b: 'ball' }
  puts :match
end

# using as_pattern to assign entire hash to var
case my_new_new_hash
in { a: 'ant' } => hash
  p hash
end
