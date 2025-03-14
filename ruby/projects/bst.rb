# require 'pp'
module TreeSorting
  def sortedArrayToBSTRecur(arr, start, ending)
    if start > ending then return nil end

    mid = start + (ending - start) / 2

    root = Node.new(arr[mid])

    root.left = sortedArrayToBSTRecur(arr, start, mid - 1)
    root.right = sortedArrayToBSTRecur(arr, mid + 1, ending)

    return root
  end

  def sortedArrayToBST(arr)
    return sortedArrayToBSTRecur(arr, 0, arr.length - 1)
  end

  def preOrder(root)
    if root.nil? then return end

    # puts(root.data)
    preOrder(root.left)
    preOrder(root.right)
  end
end

def pretty_print(node = @root, prefix = '', is_left = true)
   pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
   puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
   pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
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
  attr_accessor :root

  def initialize(arr)
    @arr = arr
    @root = nil
  end

  include TreeSorting

  def build_tree
    @root = sortedArrayToBST(@arr)
    preOrder(@root)
    @root
  end
end


input = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(input)
tree.build_tree

pretty_print tree.root
