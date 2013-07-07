class BinaryTreePrinter
  def print(tree)
    raise NotImplemented, "Please implement this method in the subclasses"
  end
end

class LoopPrinter < BinaryTreePrinter
  def print(tree)
    root = tree.root

    return "" if root.nil?

    q1 = [root]
    q2 = []

    result = root.value.to_s

    while q1.size > 0
      while q1.size > 0
        n1 = q1.shift

        if n1.left
          q2 << n1.left
        end

        if n1.right
          q2 << n1.right
        end
      end

      q1 = q2.dup

      result += "|" if q1.size > 0

      while q2.size > 0
        n2 = q2.shift

        result += n2.value.to_s
        result += " " if q2.size > 0
      end
    end

    result
  end
end

class RecursionPrinter < BinaryTreePrinter
  def print(tree)
    root = tree.root

    return "" if root.nil?

    nodes_by_level(root, 0).inject do |hash, e|
      hash.merge(e){ |k, old_val, new_val| [old_val, new_val].flatten }
    end.map do |key, value|
      value.join(" ")
    end.join("|")
  end

  private
  def nodes_by_level(node, level)
    nodes = []

    nodes << {level => [node.value]}

    if node.left
      nodes += nodes_by_level(node.left, level+1)
    end

    if node.right
      nodes += nodes_by_level(node.right, level+1)
    end

    nodes
  end
end

class Node
  attr_accessor :left
  attr_accessor :right
  attr_accessor :value

  def initialize(value=nil)
    @value = value
  end
end

class BinaryTree
  attr_accessor :root

  def initialize(root, printer=nil)
    @root = root

    @printer = printer || LoopNodePrinter.new
  end

  def print_by_level
    @printer.print(self)
  end
end
