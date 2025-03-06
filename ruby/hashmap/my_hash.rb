# raise IndexError if index.negative? || index >= @buckets.length
class HashMap
  def initialize(lf = 0.75, cap = 16)
    @lf = lf
    @cap = cap
    @hash = Array.new { Array.new(@cap) }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    @hash.append(hash_code)
  end

  def set(key, value)
    @hash.append([hash(key), value])
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

hm = HashMap.new
hm.hash('hi')
hm.hash('ih')
hm.hash('hI')
hm.hash('Hi')

p hm

# key = what hash function takes as input
# hash_code = what we find with the key
