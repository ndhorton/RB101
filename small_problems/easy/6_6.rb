# def merge(arr1, arr2)
#   joined_arr = arr1 + arr2
#   merged_arr = []
#   until joined_arr.empty?
#     if merged_arr.include?(joined_arr.first)
#       joined_arr.shift
#     else
#       merged_arr << joined_arr.shift
#     end
#   end
#   merged_arr
# end

def merge(arr1, arr2)
  arr1 | arr2
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
