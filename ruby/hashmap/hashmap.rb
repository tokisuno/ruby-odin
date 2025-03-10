require_relative('./linked_list')
require 'pp'

# raise IndexError if index.negative? || index >= @buckets.length
class HashMap
  attr_accessor :buckets

  def initialize(lf = 0.75, cap = 16, buckets = Array.new(cap) { LinkedList.new })
    @lf = lf
    @cap = cap
    @buckets = buckets
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    # load factor/re-hashing (pain)
    if self.length == @cap * @lf
      self.rehash
    end

    pos = hash(key) % @cap

    if @buckets[pos].head != nil
      if @buckets[pos].head.key == key
        @buckets[pos].head.value = value
        return
      else
        @buckets[pos].head.next_node = Node.new(key, value)
        return
      end
      return
    end
    @buckets[pos].head = Node.new(key, value)
  end

  def get(key)
    pos = hash(key) % @cap
    if @buckets[pos].head != nil
      return @buckets[pos].head.value
    else
      nil
    end
  end

  def has?(key)
    pos = hash(key) % @cap
    if @buckets[pos].head != nil
      true
    else
      false
    end
  end

  def remove(key)
    head = @buckets[hash(key) % @cap].head
    head_prev = @buckets[hash(key) % @cap].head

    loop do
      if head.key == key
        val = head.value
        # pp head
        # pp head_prev
        head_prev.next_node = nil
        @buckets[hash(key) % @cap].head = head_prev
        head = nil
        return val
      else
        head_prev = head
        head = head.next_node
      end
    end
  end

  def length
    count = 0
    @buckets.each do |bucket|
      head = bucket.head
      while head != nil
        count += 1
        head = head.next_node
      end
    end
    return count
  end

  def clear
    @cap = 16
    @buckets = Array.new(@cap) { LinkedList.new }
  end

  def keys
    keys = []
    @buckets.each do |bucket|
      head = bucket.head
      while head != nil
        keys << head.key
        head = head.next_node
      end
    end
    keys
  end

  def values
    values = []
    @buckets.each do |bucket|
      head = bucket.head
      while head != nil
        values << head.value
        head = head.next_node
      end
    end
    values
  end

  def entries
    entries = []
    @buckets.each do |bucket|
      head = bucket.head
      while head != nil
        entries << [head.key, head.value]
        head = head.next_node
      end
    end
    entries
  end

  private

  def rehash
    elems = self.entries
    @cap *=  2
    temp_hash = HashMap.new(0.75, @cap, Array.new(@cap) { LinkedList.new })
    elems.each do |elem|
      # puts "#{elem[0]}, #{elem[1]}"
      temp_hash.set(elem[0], elem[1])
    end
    # pp temp_hash
    @buckets = temp_hash.buckets
    # pp @buckets
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
hm.set('anger', 'hi')
hm.set('rahrahrah', 'hello')
hm.set('bike', 'ginger')
hm.set('aaaaaaa', 'haaaaa')

pp hm

# puts "Length of hashmap = #{hm.length}"

# pp hm.keys
# pp hm.values
# pp hm.entries
# pp hm.remove('apple')
# pp hm.remove('something')
