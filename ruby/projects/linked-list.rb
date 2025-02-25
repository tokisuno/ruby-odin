# linked list
class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def head
    puts "Value: #{@head.value}"
    puts "Next node: #{@head.next_node.value}"
    @head
  end

  def append(value)
    if @head.nil?
      @head = value
      return
    end
    node = @head
    loop do
      if !node.next_node.nil?
        node = node.next_node
      else
        node.next_node = value
        return
      end
    end
    # end
  end

  def prepend(value)
    puts 'prepending...'
    temp_head = value
    size = self.size
    # to finish another time ...
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

a = Node.new(1)
b = Node.new(2)
c = Node.new(3)
d = Node.new(4)
fool = Node.new(69)

list.append(a)
list.append(b)
list.append(c)
list.append(d)

# testing things out
# p list
puts "Size: #{list.size}"
list.head
list.prepend(fool)
