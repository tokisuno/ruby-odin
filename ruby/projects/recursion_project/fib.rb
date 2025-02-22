# frozen_string_literal: true

# fibonacci sequence again?
def fibs(elem)
  return elem if elem < 2

  fibs(elem - 1) + fibs(elem - 2)
end

def seq(size, index = 1, arr = [])
  return arr if index == size + 1

  res = fibs(index)
  arr.push(res)
  seq(size, index + 1, arr)
end

puts seq(10)
