# In cryptography, a Caesar cipher, also known as Caesar’s cipher, the shift
# cipher, Caesar’s code or Caesar shift, is one of the simplest and most widely
# known encryption techniques. It is a type of substitution cipher in which
# each letter in the plaintext is replaced by a letter some fixed number of
# positions down the alphabet. For example, with a left shift of 3, D would be
# replaced by A, E would become B, and so on. The method is named after Julius
# Caesar, who used it in his private correspondence.

def cypher(string, offset)
  lower_case = 97..122
  upper_case = 65..90

  string = string.chars.map(&:ord).map do |c|
    c + offset
    # if lower_case.include?(c) then c + offset end
    # if upper_case.include?(c) then c + offset end
  end
  print string
end

cypher('hello', 3)
