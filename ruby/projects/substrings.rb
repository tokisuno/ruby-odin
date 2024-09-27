dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
test_input = "Howdy partner, sit down! How's it going?"

def substrings(input, dict)
  string = input.downcase.split(/\W/)

  data = Array.new() { Hash.new }

  string.each do |word|
    if dict.include?(word)
      puts word
    end
  end
end

substrings(test_input, dictionary)
