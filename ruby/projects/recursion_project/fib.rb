# frozen_string_literal: true

# fibonacci sequence again?
def fibs(elem)
  return elem if elem < 2

  fibs(elem - 1) + fibs(elem - 2)
end

arr = []

(1..10).each do |fib|
  res = fibs(fib)
  arr.push(res)
end

puts arr
