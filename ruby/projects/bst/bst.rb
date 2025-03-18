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
    if root == nil then root end

    if root.data > key
      root.left = delete(key, root.left)
    elsif root.data < key
      root.right = delete(key, root.right)
    else
      if root.left.nil? then return root.right end
      if root.right.nil? then return root.left end

      succ = get_successor(root)
      root.data = succ.data
      root.right = delete(succ.right, root.right)
    end

    return root
  end

  def insert(key, root = @root)
    if root == nil
      @arr.append(key)
      @arr = @arr.uniq.sort
      return Node.new(key)
    end

    if root == key then root end

    if root.data < key
      root.right = insert(key, root.right)
    else
      root.left = insert(key, root.left)
    end
    root
  end

  def find(value)
    i = search(value)
    if !i.nil?
      return i
    else
      puts "Not found :/"
    end
  end

  def level_order(root = @root)
    res = []
    level_order_rec(0, res, root)
    return res
  end

  def preorder(root = @root)
    if root.nil? then return end
    puts root.data
    preorder(root.left)
    preorder(root.right)
  end

  def inorder(root = @root)
    if root
      inorder(root.left)
      puts root.data
      inorder(root.right)
    end
  end

  def postorder(root = @root)
    if root.nil? then return end

    postorder(root.left)
    postorder(root.right)
    puts root.data
  end

  def depth(node, root = @root)
    if root.nil? then return -1 end

    iter = -1

    if root.data == node.data
      return iter + 1
    else
      iter = depth(node, root.left)
      if iter >= 0
        return iter + 1
      else
        iter = depth(node, root.right)
        if iter >= 0
          return iter + 1
        end
      end
    return iter
    end
  end

  def height(root = @root)
    if root.nil? then return -1 end

    l_height = height(root.left)
    r_height = height(root.right)

    return [l_height, r_height].max + 1
  end

  def balanced?(root = @root)
    if root.nil? then return true end

    l_height = height(root.left)
    r_height = height(root.right)

    if l_height.abs - r_height.abs > 1 then return false end

    balanced?(root.left) and balanced?(root.right)
  end

  def rebalance
    @root = build_tree(@arr)
  end

  private

  def sorted_arr_to_bst_rec(arr, start, ending)
    if start > ending then return nil end

    mid = start + (ending - start) / 2
    root = Node.new(arr[mid])
    root.left = sorted_arr_to_bst_rec(arr, start, mid - 1)
    root.right = sorted_arr_to_bst_rec(arr, mid + 1, ending)

    return root
  end

  def sorted_arr_to_bst(arr)
    return sorted_arr_to_bst_rec(arr, 0, arr.length - 1)
  end

  def get_successor(curr)
    curr = curr.right
    while curr != nil && curr.left != nil
      curr = curr.left
    end
    return curr
  end

  def search(value, root = @root)
    if root.nil? || root.data == value then return root end

    if root.data < value then return search(value, root.right) end

    return search(value, root.left)
  end

  def level_order_rec(level, res, root = @root)
    if root.nil? then return end

    if res.length <= level then res.append([]) end
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
