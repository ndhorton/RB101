# Merge Sorted Lists

# input: two sorted arrays, arr1, arr2
# output: a merged sorted list of the combined elements from arr1 and arr2

# goal: iterate over both lists simultaneously and consider which element from
# arr1 or arr2 is less than the other. place the lesser element before the greater
# in the merged list. When one of the lists is empty, concatenate the remaining
# elements from the other to the merged list.

# Given two lists, arr1 and arr2

# Set arr1_index := 0
# Set arr2_index := 0
# Set arr1_size := number of elements in arr1
# Set arr2_size := number of elements in arr2
# Set merged_list := empty array

# Iterate over the arrays while arr1_index < arr1_size and arr2_index < arr2_size
#   Compare arr1[arr1_index] to arr2[arr2_index]
#     If arr1[arr1_index] is smaller or they are the same
#       Add arr1 element to merged_list
#       Increment arr1_index
#     Else
#       Add arr2 element to merged_list
#       Increment arr2_index
#     End if
# End iteration

# If arr1_idx < arr1_size
#   Concatenate remaining elements from arr1 to merged_list
# Else if arr2_idx < arr2_size
#   Concatenate remaining elements from arr1 to merged_list
# End if

# def merge(list1, list2)
#   list1_idx = 0
#   list2_idx = 0
#   list1_size = list1.size
#   list2_size = list2.size
#   merged_list = []

#   loop do
#     break if list1_idx >= list1_size || list2_idx >= list2_size
#     if list1[list1_idx] <= list2[list2_idx]
#       merged_list << list1[list1_idx]
#       list1_idx += 1
#     else
#       merged_list << list2[list2_idx]
#       list2_idx += 1
#     end
#   end
  
#   if list1_idx < list1_size
#     merged_list += list1[list1_idx..-1]
#   elsif list2_idx < list2_size
#     merged_list += list2[list2_idx..-1]
#   end
  
#   merged_list
# end

# LS solution
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

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
p merge([1, 2, 3, 4], [5, 6]) == [1, 2, 3, 4, 5, 6]