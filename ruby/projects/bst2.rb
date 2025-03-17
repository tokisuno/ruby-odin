 def pretty_print(node = @root, prefix = '', is_left = true)
   pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
   puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
   pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
 end

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree
  attr_accessor :root
  def initialize(arr)
    @root = build_tree(arr)
  end

  def build_tree(arr)
    arr_to_bst_recur(arr, 0, arr.length - 1)
  end
  
  def preOrder
    if @root.nil? then return end
    
    print(@root.data)
    preOrder(@root.left)
    preOrder(@root.right)
  end

  private

  def arr_to_bst_recur(arr, start, final)
    if start > final then nil end    

    mid = start + (final - start) / 2

    root = Node.new(arr[mid])
    
    root.left = arr_to_bst_recur(arr, start, mid - 1)

    root.right = arr_to_bst_recur(arr, mid + 1, final)

    @root
  end
end

arr = [1, 2, 3, 4, 5]
tree = Tree.new(arr)
tree.build_tree
pretty_print(tree.root)
