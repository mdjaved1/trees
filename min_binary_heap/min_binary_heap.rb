require_relative 'node'
require 'pry'

class MinBinaryHeap
  attr_accessor :root
  attr_accessor :items
  
  def initialize
     @items = []
     @root  = root 
  end
  
  def insert(node)
    @root = node if @items.empty?
    @items << node 
    sift_up(@items.size - 1)
    
  end
  
def sift_up(index)
  
  parent_index = (index / 2)
  return if index <= 1
  return if @items[index] >= @items[parent_index]
  switch(index, parent_index)
  sift_up(parent_index)

end
  
def sift_down(index)

  child_index = (index * 2)
  return if child_index > @items.size - 1
  not_the_last_element = child_index < @items.size - 1
  left_child = @items[child_index]
  right_child = @items[child_index + 1]
  
  if not_the_last_element && right_child < left_child
        child_index += 1
  end

  return if @items[index] <= @items[child_index]
  switch(index, child_index)
  sift_down(child_index)

end
  
  
  def switch(ele1 , ele2)
    return if @items.empty? || (ele1.nil? || ele2.nil?)
    @items[ele1]  , @items[ele2] = @items[ele2] , @items[ele1]
  end
  
  
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
  
  def delete(node)
    i = find_index(node)
    if node.nil?
      puts "working till nil "
      return nil 
    else
      puts "working till switch i is #{i}"
      switch(i , (@items.size - 1 ))
      puts"switch happened i is now #{i} and array size is #{@items.size}"
      @items.pop
      puts "item popped item size is now #{@items.size} and the array is #{@items}"
      sift_down(i)
    end
  end
  
  def find_index(node)
    i = 0 
    @items.each do |ele| 
      if ele.title == node.title 
        return i
      else
        i += 1
      end
    end
    i 
  end
  
  def printf
    arr = @items
    if !arr.nil?
      arr.each do |ele|
        puts "#{ele.title}#{ele.rating}"
      end
    end
  end
end