def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
end

def print_orders(tree)
  puts ''
  puts '# Level order'
  puts tree.level_order

  puts '# Preorder'
  puts tree.preorder

  puts '# Inorder'
  puts tree.inorder

  puts '# Postorder'
  puts tree.postorder
end

class Node
  attr_accessor :left, :right, :data

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree
  attr_accessor :root, :arr

  def initialize(arr)
    @arr = arr.uniq.sort
    @root = build_tree(arr.uniq.sort)
  end

  def build_tree(arr)
    @root = sorted_arr_to_bst(arr)
    # preorder(@root)
    @root
  end

  def delete(key, root = @root)
    root if root.nil?

    if root.data > key
      root.left = delete(key, root.left)
    elsif root.data < key
      root.right = delete(key, root.right)
    else
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      succ = get_successor(root)
      root.data = succ.data
      root.right = delete(succ.right, root.right)
    end

    root
  end

  def insert(key, root = @root)
    if root.nil?
      @arr.append(key)
      @arr = @arr.uniq.sort
      return Node.new(key)
    end

    root if root == key

    if root.data < key
      root.right = insert(key, root.right)
    else
      root.left = insert(key, root.left)
    end
    root
  end

  def find(value)
    i = search(value)
    return i unless i.nil?

    puts 'Not found :/'
  end

  def level_order(root = @root)
    res = []
    level_order_rec(0, res, root)
    res
  end

  def preorder(root = @root)
    return if root.nil?

    puts root.data
    preorder(root.left)
    preorder(root.right)
  end

  def inorder(root = @root)
    return unless root

    inorder(root.left)
    puts root.data
    inorder(root.right)
  end

  def postorder(root = @root)
    return if root.nil?

    postorder(root.left)
    postorder(root.right)
    puts root.data
  end

  def depth(node, root = @root)
    return -1 if root.nil?

    iter = -1

    return iter + 1 if root.data == node.data

    iter = depth(node, root.left)
    return iter + 1 if iter >= 0

    iter = depth(node, root.right)
    return iter + 1 if iter >= 0

    iter
  end

  def height(root = @root)
    return -1 if root.nil?

    l_height = height(root.left)
    r_height = height(root.right)

    [l_height, r_height].max + 1
  end

  def balanced?(root = @root)
    return true if root.nil?

    l_height = height(root.left)
    r_height = height(root.right)

    return false if l_height.abs - r_height.abs > 1

    balanced?(root.left) and balanced?(root.right)
  end

  def rebalance
    @root = build_tree(@arr)
  end

  private

  def sorted_arr_to_bst_rec(arr, start, ending)
    return nil if start > ending

    mid = start + (ending - start) / 2
    root = Node.new(arr[mid])
    root.left = sorted_arr_to_bst_rec(arr, start, mid - 1)
    root.right = sorted_arr_to_bst_rec(arr, mid + 1, ending)

    root
  end

  def sorted_arr_to_bst(arr)
    sorted_arr_to_bst_rec(arr, 0, arr.length - 1)
  end

  def get_successor(curr)
    curr = curr.right
    curr = curr.left while !curr.nil? && !curr.left.nil?
    curr
  end

  def search(value, root = @root)
    return root if root.nil? || root.data == value

    return search(value, root.right) if root.data < value

    search(value, root.left)
  end

  def level_order_rec(level, res, root = @root)
    return if root.nil?

    res.append([]) if res.length <= level
    res[level].append(root.data)

    level_order_rec(level + 1, res, root.left)
    level_order_rec(level + 1, res, root.right)
  end
end

input = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(input)
tree.insert(69)
tree.delete(1)

# puts tree.find(69)
# puts tree.find(420)

# puts tree.level_order
# puts '# Preorder'
# puts tree.preorder
#
# puts '# Inorder'
# puts tree.inorder
#
# puts '# Postorder'
# puts tree.postorder

numbz = [5, 19, 22, 24, 25, 30, 47, 50, 51, 59, 88, 71, 87, 95, 96]
# temp_arr = Array.new(15) { rand(1..100) }
numbz.each do |elem|
  tree.insert(elem)
end

# print_orders(tree)

# p tree.arr
tree.rebalance
puts tree.balanced?
pretty_print tree.root

# node = tree.find(69)
# puts "Height: #{tree.height(node)}"
# puts "Depth: #{tree.depth(node)}"
