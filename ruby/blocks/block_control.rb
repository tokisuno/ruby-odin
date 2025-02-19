# if you're writing a method with yield...
# how can you be sure the caller will include a block?
# what if they don't?

# def simple_method
#   yield
# end
#
# simple_method

def maybe_block
  if block_given?
    puts 'block party'
  end
  puts 'executed regardless'
end

maybe_block

maybe_block {}
