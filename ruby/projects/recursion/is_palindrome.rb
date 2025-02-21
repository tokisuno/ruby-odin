# frozen_string_literal: true

# get char on opposite side of char array.
# if they're the same, remove both on each side
# call palendrome with new string
def palindrome?(input, original_word = input)
  if input.length == 0 || input.length == 1
    puts "#{original_word} is a palendrome!"
    return
  end

  input = input.split('')
  first = input.pop
  last = input.shift

  if first == last
    if input.length == 2
      puts "#{original_word} is a palendrome!"
      return
    end
    # puts "We're getting there..."
    palindrome?(input.join(''), original_word)
  end
end

palindrome?('hello')
palindrome?('racecar')
palindrome?('howdy')
palindrome?('stanleyyelnats')
