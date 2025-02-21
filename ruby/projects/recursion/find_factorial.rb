# frozen_string_literal: true

# finding factorial
def findfac(num, total = 1)
  return total if num <= 0

  puts num
  findfac(num - 1, total * num)
end

puts findfac(5)
