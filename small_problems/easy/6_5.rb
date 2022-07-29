# def reverse(arr)
#   reversed_arr = []
#   i = -1

#   while i >= -(arr.size)
#     reversed_arr << arr[i]
#     i -= 1
#   end

#   reversed_arr
# end

# LS solution
# def reverse(array)
#   result_array = []
#   array.reverse_each { |element| result_array << element }
#   result_array
# end

# each_with_object solution
# def reverse(array)
#   array.each_with_object([]) { |element, hash| hash.unshift(element) }
# end

# inject solution
# def reverse(array)
#   return array if array.size < 2
#   array.inject { |memo, object| [object] + [memo] }.flatten
# end

# LS student (Jacob Taylor) inject solution
# def reverse(array)
#   array.inject([], :unshift )
# end

# More verbose/easier to understand version of above
def reverse(array)
  array.inject([]) { |memo, elem| memo.unshift(elem) }
end

# much like
# array.inject(:+) will run memo.+(element) on each element and store the sum in memo
# for the next iteration

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true