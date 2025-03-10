require_relative('./linked_list')
require 'pp'

# raise IndexError if index.negative? || index >= @buckets.length
class HashMap
  def initialize(lf = 0.75, cap = 16)
    @lf = lf
    @cap = cap
    @buckets = Array.new(@cap) { LinkedList.new }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    limit = @cap * @lf
    if self.length == limit
      (1..@cap).each do |list|
        @buckets << LinkedList.new
      end
      @cap = @cap * 2
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
  end

  def has?(key)
  end

  def remove(key)
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

# p LinkedList.instances

# puts "Length of hashmap = #{hm.length}"

# pp hm

# pp hm.keys
# pp hm.values
pp hm.entries
