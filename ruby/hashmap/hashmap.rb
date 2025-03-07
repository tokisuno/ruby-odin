require_relative('./linked_list')
require 'pp'

# raise IndexError if index.negative? || index >= @buckets.length
class HashMap
  def initialize(lf = 0.75, cap = 16)
    @lf = lf
    @cap = cap
    @buckets = Array.new(@cap) { |list| list = LinkedList.new }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    pos = hash(key) % @cap
    if @buckets[pos].head != nil
      if @buckets[pos].head.key == key
        @buckets[pos].head.value = value
        return
      else
        @buckets[pos].head.next_node = Node.new(key, value)
        return
      end

      puts @buckets[pos].head.value
      return
    end
    @buckets[pos].head = Node.new(key, value)
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
hm.set('apple', 'red')
hm.set('banana', 'yellow')
hm.set('carrot', 'orange')
hm.set('dog', 'brown')
hm.set('elephant', 'gray')
hm.set('frog', 'green')
hm.set('grape', 'purple')
hm.set('hat', 'black')
hm.set('ice cream', 'white')
hm.set('jacket', 'blue')
hm.set('kite', 'pink')
hm.set('lion', 'golden')
hm.set('something', 'something_else')
hm.set('apple', 'ragnarok, god of destruction')

p LinkedList.instances
# hm.hash('hi')
# hm.hash('ih')
# hm.hash('hI')
# hm.hash('Hi')

pp hm
