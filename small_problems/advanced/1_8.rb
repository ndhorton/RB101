# Merge Sort

# input: given an unsorted array
# output: a sorted array

# base case: 
#   array size is 1
#     return array

# merge(merge_sort(array[0...array.size/2]), merge_sort(array[array.size/2..-1]))

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

def merge_sort(list)
  return list if list.size <= 1

  merge(merge_sort(list[0...list.size/2]), merge_sort(list[list.size/2..-1]))
end

# LS solution

def merge_sort(array)
  return array if array.size == 1

  sub_array1 = array[0...array.size/2]
  sub_array2 = array[array.size/2..-1]

  sub_array1 = merge_sort(sub_array1)
  sub_array2 = merge_sort(sub_array2)

  merge(sub_array1, sub_array2)
end

# Further explorations

# [ [14, 33, 27, 10], [35, 19, 42, 44] ]

# elements = 8
# while elements < 0
# split_list << list[0...list.size/2]
# split_list << list[list.size/2..-1]
# elements /= 2
# [ [[14, 33]]]


# This doesn't count because you aren't creating and merging the same grouped
# structures ? I think?
def merge_sort(array) 
  atomics = array.map { |n| [n] }
  atomics.reduce([]) { |merged_arr, atomic| merge(merged_arr, atomic) }
end





p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]