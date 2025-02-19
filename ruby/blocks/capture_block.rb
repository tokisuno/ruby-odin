# frozen_string_literal: true

def cool_method(&my_block)
  my_block.call
end

cool_method { puts 'cool' }

def cooler_method
  yield
end

my_proc = proc { puts 'proc party' }
cooler_method(&my_proc)
