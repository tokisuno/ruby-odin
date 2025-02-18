my_lambda = -> { puts 'high five' }
my_lambda.call

my_name = ->(name) { puts "hello #{name}" }
my_age = lambda { |age| puts "I am #{age} years old." }

my_name.call('lucas')
my_age.call(22)
