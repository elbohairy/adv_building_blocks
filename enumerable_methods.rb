=begin
  Great way to learn how to create methods that use procs and blocks,
  as well as learning how iterators work.

  I have no idea why I used the times iterator in the each methods, instead of just using
  a for loop, but oh well.
  
=end

module Enumerable
  def my_each
    arrayed = self.to_a
    last_index = arrayed.length
    
    last_index.times do |index|
      yield arrayed[index]
    end
    
  end
  
  def my_each_with_index
    arrayed = self.to_a
    last_index = arrayed.length
    
    last_index.times do |index|
      yield arrayed[index], index
    end
  end
  
  def my_select
    arrayed = self.to_a
    
    last_index = arrayed.length
    
    new_arrayed = []
    
    last_index.times do |index|
      result = yield arrayed[index]
      if result
        new_arrayed << arrayed[index]
      end
    end
    
    new_arrayed
      
  end
  
  def my_all?
    arrayed = self.to_a
    
    last_index = arrayed.length
    
    outcome = true
    
    last_index.times do |index|
      result = yield arrayed[index]
      if result == false
        outcome = false
      end
    end
    
    outcome
  end
  
  
  def my_any?
    
    self.my_each do |item|
      result = yield item
      
      if result == true
        return true
      end
    end
    
    false
  end
  
  def my_none?
    
    self.my_each do |item|
      result = yield item
      
      if result == true
        return false
      end
    end
    
    true
  end
  
  def my_count
    counter = 0
    if block_given?
      self.my_each do |item|
        result = yield item
        
        if result == true
          counter += 1
        end
      end
    else
      array = self.to_a
      counter = array.length
    end
    
    counter
  end
  
  
  def my_map
    
    mapped_array = []
    
    self.my_each do |item|
      result = yield item
      
      mapped_array << result
    end
    
    mapped_array
  end
  
  
  def my_inject
    accumulator = self[0]
    
    self[1..-1].my_each do |item|
      accumulator = yield accumulator, item
    end
    
    accumulator
  end
  
  def my_map_proc a_proc
    mapped_array = []
    
    self.my_each do |item|
      result = a_proc.call item
      
      mapped_array << result
    end
    
    mapped_array
  end
  
  def my_map_proc_and_block a_proc=0
    mapped_array = []
  
    if block_given? and !(a_proc.class == Proc)
      self.my_each do |item|
      result = yield item
      
      mapped_array << result
      end
    
      return mapped_array
    else
      self.my_map_proc a_proc
    end
      
  end
  
  

end


def multiply_els(array)
  array.my_inject do |accumulator, element|
    accumulator * element
  end
end



# TESTS

a = {bird: 5, dog: 10}
b = ["words", "birds", "and other thangs"]

a.each do |x, y|
  p x
end

p "LOL"
a.my_each do |i, j|
  p "#{i} BUrrrrP #{j}"
end


p "DOONULD TUMMP"
b.my_each_with_index do |i, j|
  p "#{i} BUrrrrP INDEXtor -- #{j}"
end
p "NANsee PUH low SEE"

b.my_select do |i|
  i.length > 5
end
p "hiccccup"
b.my_all? do |i|
  i.length > 5
end

b.my_any? do |i|
  i.length > 20
end

b.my_none? do |i|
  i.length > 20
end

b.my_count do |i|
  i.length > 4
end


b.my_map do |i|
  i + "DRUGS IS DA ANSWER"
end

[5, 3, 2].my_inject do |i, j|
  i + j
end


multiply_els([5,3,2,2])

procalicious = Proc.new do |i|
  i + "dat wall"
end


b.my_map_proc procalicious


p b.my_map_proc_and_block procalicious do |i| 
  i + "LOLoloLOLoloOLO"
end












