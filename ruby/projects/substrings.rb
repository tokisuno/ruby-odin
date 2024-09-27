dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
test_input = "Howdy partner, sit down! How's it going?"

def substrings(input, dict)
  string = input.downcase.split(/\W/)

  hash = {}
  string.each do |word|
    if dict.include?(word)
      if hash.include?(word) then hash[word] += 1 else hash[word] = 1 end
    end
  end
  puts hash
end

substrings(test_input, dictionary)
