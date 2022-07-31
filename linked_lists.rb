class Linked_list
  def initialize(head=nil)
    self.head = head
  end

  protected

  attr_accessor :head
end

class Node
  def initialize(value=nil, next_node=nil)
    self.value = value
    self.next_node = next_node
  end

  protected 

  attr_accessor :value, :next_node
end
