def logger
  yield
end

logger { puts 'hello from the block!' }

logger do
  p [1, 2, 3]
end

def double_vision
  yield
  yield
end

double_vision { puts 'how many fingers am i holding up?' }

def love_language
  yield('Ruby')
  yield('Rails')
end

love_language { |lang| puts "I love #{lang}" }
