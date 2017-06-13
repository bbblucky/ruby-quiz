class Node
  attr_accessor :node, :next, :prev

  def self.last(node)
    return node if node.next.nil?
    node = last(node.next)
  end

  def self.reverse(node)
    return node if node.next.nil?
    while node != nil
      head = node
      node = head.next
      head.next = node.prev
      head.prev = node
    end
    head
  end

  def self.node_list(node, msg = nil)
    msg ||= ""
    return msg[0..-5] if node.nil?
    node_list(node.next, msg << "#{node.node} <-> ")
    node. =
  end


  def initialize(node)
    @node = node
    @node.next = nil
    @node.prev = nil
  end

  def self.prev(node)

  end
end

node = Node.new(1)
100.times do |i|
  i += 1
  eval("Node.last(node).next = Node.new(i + 1)")
end

# puts Node.node_list node
puts "========="
puts Node.node_list Node.reverse(node)
puts Node.last(node).node
