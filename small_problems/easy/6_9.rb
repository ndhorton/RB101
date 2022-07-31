# def include?(array, search_value)
#   array.each { |element| return true if element == search_value }

#   false
# end

# LS solution
# def include?(array, search_value)
#   !!array.find_index(search_value)
# end

def include?(array, search_value)
  boolean_value = false
  
  i = 0
  while i < array.size
    if array[i] == search_value
      boolean_value = true
    end
    i += 1
  end
  
  boolean_value
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# input: an array and a search value
# output: a Boolean expressing if the search value is a value in the array

# an empty array will return false

# -given an array
# -iterate through the array
# --if the search value matches an element
# ---return true
# -return false

