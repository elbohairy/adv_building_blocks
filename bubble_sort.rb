a = [3, 2, 1, 4, -1, 0, 90, -100]

def bubble_sort(array)
  last_index = array.length - 1
  
  array = swapping_elements(array)
  
  test = nesting_array(array)
  
  until checker(test)
    array = swapping_elements(array)
    test = nesting_array(array)
  end
  
  array
  
end


def swapping_elements(array)
  last_index = array.length - 1
  
  last_index.times do |i|
    if array[i] > array[i+1]
      array[i], array[i+1] = array[i+1], array[i]
    end
  end
  
  array
end

def nesting_array(array)
  last_index = array.length - 1
  
  result = []
  
  last_index.times do |i|
    result.push( [ array[i], array[i+1] ] )
  end
  
  result
  
end
    
def checker(nested_array)
  nested_array.all? do |first, second|
    first < second
  end
end

p bubble_sort(a)