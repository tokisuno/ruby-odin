roman_mapping = {
  'M' => 1000,
  'CM' => 900,
  'D' => 500,
  'CD' => 400,
  'C' => 100,
  'XC' => 90,
  'L' => 50,
  'XL' => 40,
  'X' => 10,
  'IX' => 9,
  'V' => 5,
  'IV' => 4,
  'I' => 1
}

def roman_to_int(roman_mapping, input, result = 0)
  return result if input.empty?

  roman_mapping.keys.each do |roman|
    if input.start_with?(roman)
      result += roman_mapping[roman]
      input = input.slice(roman.length, input.length)
      return roman_to_int(roman_mapping, input, result)
    end
  end
end

puts roman_to_int(roman_mapping, 'MDCL')
