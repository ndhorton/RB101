# Does My List Include This?

# input: an array, list, and an object, search_value
# output: a boolean true if the list contains the search value, false otherwise

# Given an array, list, and an object, search_value
# Iterate through each element in list
#   If element == search_value
#     Return true
# Return false

def include?(list, search_value)
  list.each { |element| return true if element == search_value }
  false
end

# LS solution

def include(list, value)
  !!(list.find_index(value))
end

def include?(list, value)
  !!(list.index(value))
end

def include?(list, value)
  !!(list.rindex(value))
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
