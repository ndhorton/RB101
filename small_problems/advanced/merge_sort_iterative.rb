# Iterative Merge Sort

def merge(list1, list2)
  merged_list = []
  idx2 = 0

  list1.each do |list1_value|
    while idx2 < list2.size && list2[idx2] <= list1_value
      merged_list << list2[idx2]
      idx2 += 1
    end
    merged_list << list1_value
  end

  merged_list.concat(list2[idx2..-1])
end

# Further explorations

# With some tips taken from StackOverflow user lalatnayak's Python solution
def merge_sort(list)
  return list if list.size < 2
  
  bounds = list.size - 1
  low = 0
  high = 1
  mid = high / 2
  group_size = 2
  
  while group_size <= list.size
  
    while low < list.size
      if high <= bounds
        list[low..high] = merge(list[low..mid], list[mid+1..high])
      else
        list[low-group_size..-1] = merge(list[low-group_size..high-group_size], list[low..-1])
      end
      low += group_size
      high += group_size
      mid = low + (high - low)/2
    end
  
    group_size *= 2
    low = 0
    high = group_size - 1
    mid = low + (high - low)/2
  end
  list
end

# After reading Geeksforgeeks' Python solution
# think this algorithm actually runs more loops and 
# calls merge more often but with fewer elements passed in
# for the non-power of 2 overflow groups
# so fewer elements end up being sorted multiple times
  return arr if arr.size < 2
  list = arr.dup # could use block if the elements are strings
                 # and could use clone if you know nothing will be frozen
                 # (though clone sine 2.4 lets you pass an argument 
                 # to ignore freeze)
  
  bounds = list.size - 1
  group_size = 1
  
  while group_size < bounds + 1
    low = 0
    
    while low < bounds + 1
      high = (low + (group_size * 2 - 1) < bounds ? low + (group_size * 2 - 1) : bounds)
      mid = (low + group_size - 1 < bounds ? low + group_size - 1 : bounds)

      # on some iterations the list[mid+1..high] only works 
      # because e.g array[11..10] produces an empty array
      list[low..high] = merge(list[low..mid], list[mid+1..high])
      low += group_size * 2
    end
  
    group_size *= 2
  end
  list
end


list = [*(1..32)].shuffle
p list
p merge_sort(list)
p list
