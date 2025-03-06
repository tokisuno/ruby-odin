# raise IndexError if index.negative? || index >= @buckets.length
class HashMap
  def initialize(lf, cap)
    @lf = lf
    @cap = cap
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
  end

  def get(key)
  end

  def hash?(key)
  end

  def remove(key)
  end

  def length
  end

  def clear
  end

  def keys
  end

  def values
  end

  def entries
  end
end

# key = what hash function takes as input
# hash_code = what we find with the key
