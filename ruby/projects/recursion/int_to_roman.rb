# frozen_string_literal: true

# non-recursive version
def lame_to_roman(val, res = [])
  roman_mapping = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  # actual gore
  val = val.to_s.split(//).map(&:to_i)
  size = val.size
  val.each_with_index do |el, i|
    el *= (10**(size - i - 1))
    puts el
    if roman_mapping.keys.include?(el)
      res << roman_mapping[el]
      next
    end
    res << nil
  end

  res.join
end

p lame_to_roman(1555)
