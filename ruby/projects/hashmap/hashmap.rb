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
    rehash if length == @cap * @lf

    pos = hash(key) % @cap

    unless @buckets[pos].head.nil?
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
    head = @buckets[hash(key) % @cap].head
    loop do
      if !head.nil?
        if head.key == key
          puts "#{head.key}, #{key}"
          return head.value
        else
          head = head.next_node
        end
      end
    end
  end

  def has?(key)
    head = @buckets[hash(key) % @cap].head
    loop do
      if !head.nil?
        if head.key == key
          return true
        else
          head = head.next_node
        end
      else
        return false
      end
    end
  end

  def remove(key)
    # list = @buckets[hash(key) % @cap]
    # index = list.find(key)
    # list.remove_at(index)
    head = @buckets[hash(key) % @cap].head
    head_prev = head
    loop do
      if head.key == key
        val = head.value
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
      until head.nil?
        count += 1
        head = head.next_node
      end
    end
    count
  end

  def clear
    @cap = 16
    @buckets = Array.new(@cap) { LinkedList.new }
  end

  def keys
    keys = []
    @buckets.each do |bucket|
      head = bucket.head
      until head.nil?
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
      until head.nil?
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
      until head.nil?
        entries << [head.key, head.value]
        head = head.next_node
      end
    end
    entries
  end

  private

  def rehash
    elems = entries
    @cap *= 2
    temp_hash = HashMap.new(0.75, @cap, Array.new(@cap) { LinkedList.new })
    elems.each do |elem|
      temp_hash.set(elem[0], elem[1])
    end
    @buckets = temp_hash.buckets
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
# pp hm.get('bike')
# pp hm.has?('bike')
# puts "Length of hashmap = #{hm.length}"

# pp hm.keys
# pp hm.values
# pp hm.entries
# pp hm.remove('apple')
pp hm.remove('something')
pp hm
