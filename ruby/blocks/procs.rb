a_proc = proc { puts 'this is a proc' }
a_proc.call

a_proc = proc { |name, age| puts "name: #{name} --- age: #{age}" }
a_proc.call('lucas', 22)
