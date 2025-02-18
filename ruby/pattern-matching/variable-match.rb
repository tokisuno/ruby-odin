# BASIC
age = 15

case age
in a
  puts a
end

# BINDING
a = 5

case 1
in a
  a
end

puts a

# PIN OPERATOR
a = 5

case 1
in ^a
  :no_match
end
