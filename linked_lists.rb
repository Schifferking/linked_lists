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
    return false if head.value.nil?

    node = head
    return true if value == node.value || value == node.next_node.value

    until node.next_node.nil? || value == node.value
      return true if value == node.value || value == node.next_node.value

      node = node.next_node
    end
    false
  end

  def find(value)
    return nil unless contains?(value)
    return 0 if value == head.value

    node = head.next_node
    node_index = 1
    return node_index if value == node.value

    until node.next_node.nil? || value == node.value
      return node_index if value == node.value
      return node_index + 1 if value == node.next_node.value

      node_index += 1
      node = node.next_node
    end
    nil
  end

  def to_s
    return nil if head.value.nil?

    node = head
    linked_list_string = "( #{node.value} )"
    return linked_list_string + " -> nil" if size == 1

    node = node.next_node

    until node.next_node.nil?
      linked_list_string += " -> ( #{node.value} )"
      node = node.next_node
    end
    linked_list_string += " -> ( #{node.value} ) -> nil"
  end

  def insert_at(value, index)
    return nil if index - size >= 2
    return prepend(value) if index.zero?
    return append(value) if index == size

    new_node = Node.new(value)
    previous_node = at(index - 1)
    tmp_node = at(index)
    previous_node.next_node = new_node
    new_node.next_node = tmp_node
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    self.value = value
    self.next_node = next_node
  end
end
