# frozen_string_literal: true

# without recursion
def countdown(num)
  loop do
    return if num.zero?

    puts num
    num -= 1
  end
end

countdown(3)

# with recursion
def cd(num)
  return if num <= 0

  puts num
  cd(num - 1)
end

cd(3)
