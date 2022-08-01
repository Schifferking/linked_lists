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

  def at(index)
    return nil if index > size
    return tail if index == size - 1

    node = head
    nodes_count = 0
    until nodes_count == index || node.next_node.nil?
      node = node.next_node
      nodes_count += 1
    end
    node
  end

  def pop
    return self.head = nil if size == 1

    second_to_last_node = at(size - 2)
    second_to_last_node.next_node = nil
  end

  def contains?(value)
    node = head
    return true if value == node.value || value == node.next_node.value

    until node.next_node.nil? || value == node.value
      return true if value == node.value || value == node.next_node.value

      node = node.next_node
    end
    false
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    self.value = value
    self.next_node = next_node
  end
end
