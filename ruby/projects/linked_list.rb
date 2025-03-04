# linked list
class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
      return
    end
    node = @head
    loop do
      if !node.next_node.nil?
        node = node.next_node
      else
        node.next_node = Node.new(value)
        return
      end
    end
    # end
  end

  def prepend(value)
    temp = @head
    value.next_node = temp
    @head = value
  end

  def size
    counter = 0
    head = @head
    loop do
      if !head.next_node.nil?
        counter += 1
        head = head.next_node
        next
      end
      counter += 1
      return counter
    end
  end

  def head
    @head
  end

  def tail
    pos = @head
    loop do
      if pos.next_node != nil
        pos = pos.next_node
        next
      else
        puts "Tail: #{pos.value}"
        return pos
      end
    end
  end

  def at(index)
    counter = 0
    size = self.size
    item = @head
    loop do
      if index > size
        puts "ERR: Out of range"
        return -1
      end
      if counter == index
        # puts "Value at #{index}: #{item.value}"
        return item.value
      else
        item = item.next_node
        counter = counter += 1
      end
    end
  end

  def pop
    counter = 0
    pos = @head
    head = LinkedList.new(Node.new(pos.value))
    pos = pos.next_node
    while counter <= self.size - 2
      if counter.zero?
        counter += 1
        next
      else
        head.append(Node.new(pos.value))
        pos = pos.next_node
        counter += 1
      end
    end
    @head = head.head
  end

  def contains(value)
    pos = @head
    counter = 0
    loop do
      if counter == self.size then return false end
      if pos.value == value
        return true
      else
        pos = pos.next_node
        counter += 1
        next
      end
    end
  end

  def find(value)
    counter = 0
    while counter < self.size
      if value == self.at(counter)
        return counter
      else
        counter += 1
        next
      end
    end
  end

  def to_s
    counter = 0
    output = ''
    while counter < self.size
      if self.at(counter) == nil
        output << "nil\n"
      end
      output << "( #{self.at(counter)} ) -> "
      counter += 1
    end
    output << "nil\n"
  end

  def insert_at(value, index)
    counter = 0
    new_list = LinkedList.new()
    while counter < self.size
      if counter == index
        new_list.append(value)
      end
      new_list.append(self.at(counter))
      counter += 1
    end
    @head = new_list.head
  end

  def remove_at(index)
    counter = 0
    new_list = LinkedList.new()
    while counter < self.size
      if counter == index
        counter += 1
        next
      else
        new_list.append(self.at(counter))
        counter += 1
      end
    end
    @head = new_list.head
  end
end

# linked list node
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

puts list

list.insert_at('oranges', 1)

puts list

list.remove_at(1)

puts list

# a = Node.new(1)
# b = Node.new(2)
# c = Node.new(3)
# d = Node.new(4)
#
# fool = Node.new(69)
#
# list.append(a)
# list.append(b)
# list.append(c)
#
# list.append(d)
# list.prepend(fool)
# list.head
# list.tail
# list.pop
# puts list
# p list.find(2)
# list.at(3)
# p list
# list.tail
# p list.contains(4)
# p list.at(0)
# list.head
