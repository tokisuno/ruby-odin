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
    el_full = el * (10**(size - i - 1))
    puts el_full
    puts el
    if roman_mapping.keys.include?(el_full)
      if i == 0
        if el == 1
          res << roman_mapping[el_full]
          next
        else
          res << roman_mapping[el_full] * el
        end
      end
      res << roman_mapping[el]
      next
    end
    res << nil
  end

  res.join
end

p lame_to_roman(2555)
