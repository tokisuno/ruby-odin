def integer_to_roman(roman_mapping, number, result = "")
  return result if number == 0

  roman_mapping.keys.each do |divisor|
    quotient, modulus = number.divmod(divisor)
    puts "NUM: #{number}\nDIV: #{divisor}\nQUO: #{quotient}\n-----"
    result << roman_mapping[divisor] * quotient
    return integer_to_roman(roman_mapping, modulus, result) if quotient > 0
  end
end

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

p integer_to_roman(roman_mapping, 8888)
