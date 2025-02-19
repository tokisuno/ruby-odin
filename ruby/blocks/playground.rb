# frozen_string_literal: true

def say_something
  yield
end

# if you don't pass a value with yield, and a block expects one
# ... then the argument is assigned nil
say_something do |word|
  puts "...and THEN I said #{word}"
end

def mad_libs
  # 3 args passed to yield
  yield('cool', 'beans', 'burrito')
end

mad_libs do |adjective, noun|
  # block only takes 2 args
  puts "I said #{adjective} #{noun}"
end

# if working with hashes, make sure your block names two parameters
def awesome_method
  hash = { a: 'apple', b: 'banana', c: 'cookie' }
  hash.each do |key, value|
    yield key, value
  end
end

awesome_method { |key, value| puts "#{key}: #{value}" }

# similiarities between proc and lambda
## 1: They both support default arguments
my_proc = Proc.new { |name = 'bob'| puts name }
my_proc.call

my_lambda = ->(name = 'r2d2') { puts name }
my_lambda.call

## 2: Method parameters (they can be used as args to a method)
def my_method(useful_arg)
  useful_arg.call
end

my_lambda = -> { puts 'lambda' }
my_proc = Proc.new { puts 'proc' }

my_method(my_lambda)
my_method(my_proc)
