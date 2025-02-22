# frozen_string_literal: true

def how_many?(bottles)
  if bottles.zero?
    puts 'no more bottles of beer on the wall'
    return
  end

  puts "#{bottles} bottles of beer on the wall..."
  how_many?(bottles - 1)
end

how_many?(12)
