# frozen_string_literal: true

# define recursive function that takes arg n and returns nth fib number

# fibonacci function
def fib(el)
  return el if el <= 1

  fib(el - 1) + fib(el - 2)
end

puts fib(5)
puts fib(8)
puts fib(10)
