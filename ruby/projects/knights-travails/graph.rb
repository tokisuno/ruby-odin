# Graph node
class GraphNode
  attr_accessor :value, :neighbours

  def initialize(value)
    @value = value
    @neighbours = []
  end

  def add_edge(neighbour)
    @neighbours << neighbour
  end
end

# Graph
class Graph
  attr_accessor :node

  def initialize
    @nodes = []
  end

  def add_node(value)
    @nodes << GraphNode.new(value)
  end
end
