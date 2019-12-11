require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root 
    
  end

  def insert(root, node)
    if root.rating > node.rating 
      if root.left.nil?
        root.left = node 
      else
        insert(root.left,node)
      end
    else
      if root.right.nil?
        root.right = node
      else
        insert(root.right,node)
      end
    end
  end
  

  # Recursive Depth First Search
  def find(root, data)
    if root.nil?
      nil 
    elsif root.title == data
      return root 
    elsif root.right != nil 
      find(root.right , data)
    elsif root.left != nil 
      find(root.left ,data)
    end
  end

 
  
  
  def delete(root, data)
    if root.title == data
      return remove(root)
    end
    if !root.left.nil?
      root.left = delete(root.left, data)
    end
    if !root.right.nil?
      root.right = delete(root.right, data)
    end
  end
  
  def remove(node)
    if !node.left.nil? && node.right.nil?
      return node.left
    elsif node.left.nil? && !node.right.nil?
      return node.right
    elsif node.left.nil? && node.right.nil?
      return nil 
    else
      return delete_node_with_two_children(node)
    end
  end
  
  def delete_node_with_two_children(node)
    puts "reaching del two "
    min_node = find_min_node(node.right)
    replace_value(min_node, node)
    remove_min_node(min_node)
  end
  
  def find_min_node(node)
    if node.left.nil?
      puts "reaching find_min"
      min_node = node
      return min_node
    else
      puts "reaching else for find min "
      find_min_node(node.left)
    end
  end
  
  def replace_value(min_node,node)
    puts "reaching replace value "
    node.title = min_node.title
    node.rating = min_node.rating
  end
  
  def remove_min_node(min_node)
    puts "reaching remove min node "
    min_node = nil 
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    if children == nil
      children = [@root]
    end
    arr = []
    children.each do |ele|
      puts "#{ele.title}: #{ele.rating}"
      arr << ele.left if ele.left != nil
      arr << ele.right if ele.right != nil
    end
    if arr.size == 0
      return nil
    else
      printf(arr)
    end
  end
end