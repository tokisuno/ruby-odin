some_other_value = true

# a way to make sure the pattern is only matches
# if the guard condition holds true
case 0
in 0 if some_other_value
  puts :match
end
