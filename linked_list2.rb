class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end


# -------- METHODS ------- #

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(current_node, previous_node=nil)

  # update next node to point at node on opposite side
  # [1] => [2] => [3] => nil
  # [1] => nil
  # [2] => 1
  # [3] => 2

  next_node = current_node.next_node

  # At any point, we need to know what's currently next, what node we are on, and what node is behind us.
  # on each step, we update the current node's pointer from pointing forward to pointing to the previous node
  # we then change "previous" to be the node we're on before we step forward, so current is now behind us

  while next_node
      # this is redundent on the first pass, but is important on future passes
      next_node = current_node.next_node

      current_node.next_node = previous_node
      previous_node = current_node
      current_node = next_node
  end

  previous_node

end


# ---- CODE TO EXECUTE WHATEVER ---- #


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)

print_values(revlist)
