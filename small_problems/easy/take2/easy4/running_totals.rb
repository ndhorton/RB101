# Running Totals

# input: an array
# output: a new array of the same size as the input array
# whose elements are the sum of every element from
# the input array up to and including that index

# e.g.
# f([2, 5, 13]) -> [2, 7, 20]

# empty array arg returns an empty array


# Given an array, list
# Set sum_list := empty array
# Set total := 0
# Iterate over list
#   Add current element to total
#   Append total to sum_list
# Return sum_list

# def running_total(list)
#   total = 0
#   list.each_with_object([]) do |element, sum_list|
#     total += element
#     sum_list << total
#   end
# end

# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end

def running_total(array)
  total = 0
  array.inject([]) do |sum_arr, element|
    total += element
    sum_arr << total
  end
end

def running_total(array)
  sum_arr = []
  array.inject(0) do |total, element|
    total += element
    sum_arr << total
    total
  end
  sum_arr
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
