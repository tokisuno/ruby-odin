# Issues with this
# - You might have two names that add up to the same hash value

def string_to_number(string)
  hash_code = 0
  prime_number = 31
  string.each_char { |char| hash_code = prime_number * hash_code + char.ord }
  hash_code
end

def hash(name, surname)
  string_to_number(name) + string_to_number(surname)
end

my_hash = hash('lucas', 'cordero')
puts my_hash
