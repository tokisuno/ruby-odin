my_hash = {
    "a random word" => "ahoy",
    "Dorothy's math test score" => 94,
    "an array" => [1, 2, 3],
    "an empty hash within a hash" => {}
}

puts my_hash

another_hash = Hash.new
another_hash = { 9 => "nine", :six => 6 }

puts another_hash

shoes = {
  "summer" => "sandals",
  "winter" => "boots"
}

# add data to key
shoes["fall"] = "sneakers"

# change value of pre-existing key
shoes["summer"] = "flip-flops"

# removing key
shoes.delete("summer")

# directly getting only keys and values
puts shoes.keys
puts shoes.values

# merging two hashes
hash1 = { "a" => 100, "b" => 200 }
hash2 = { "c" => 254, "d" => 300}
hash1.merge(hash2)
