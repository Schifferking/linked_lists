class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    self.head = Node.new(head)
  end

  def tail
    return head if head.next_node.nil?

    node = head.next_node
    node = node.next_node until node.next_node.nil?
    node
  end

  def append(value)
    return self.head = Node.new(value) if head.value.nil?

    tail.next_node = Node.new(value)
  end

  def prepend(value)
    return append(value) if head.value.nil?

    tmp_node = head
    self.head = Node.new(value)
    head.next_node = tmp_node
  end

  def size
    return 0 if head.value.nil?
    return 1 if head.next_node.nil?

    nodes_count = 1
    node = head.next_node
    until node.nil?
      nodes_count += 1
      node = node.next_node
    end
    nodes_count
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    self.value = value
    self.next_node = next_node
  end
end
