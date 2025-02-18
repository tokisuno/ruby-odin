# frozen_string_literal: true

# rightward assignment
login = { username: 'hornby', password: 'iliketrains' }
## rubocop doesn't know how to deal with this LMAO
login => { username: username }

puts "Logged in with #{username}"

# find pattern
case [1, 2, 3]
in [*pre, 1, 2, 3, *post]
  p pre
  p post
end

# watching the find pattern work
case [1, 2, 3, 4, 5]
in [*pre, 2, 3, *post]
  p pre
  p post
end

# now we're thinking with portals...
case [1, 2, 'a', 4, 'b', 'c', 7, 8, 9]
in [*pre, String => x, String => z, *post]
  p pre
  p x
  p z
  p post
end
