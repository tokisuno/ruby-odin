def kms(val, res = [])
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

  val = val.to_s.split(//).map(&:to_i)
  size = val.size
  val.each_with_index do |num, i|
    full_num = num * (10**(size - i - 1))

    if roman_mapping.keys.include?(full_num)
      res << roman_mapping[full_num]
      next
    end

    if full_num >= 1000
      res << roman_mapping[1000] * num
      next
    end

    if full_num <= 900 && full_num >= 100
      res << roman_mapping[100] * num
      next
    end
  end
  res
end

p kms(3348)
