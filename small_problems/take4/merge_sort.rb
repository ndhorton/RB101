# Merge Sort

def merge(array1, array2)
  result = []
  index = 0
  array1.each do |element|
    while index < array2.size && array2[index] <= element
      result << array2[index]
      index += 1
    end
    result << element
  end
  result.concat(array2[index..-1])
  result
end

def merge_sort(array)
  return array if array.size <= 1

  middle = array.size / 2
  first_half = merge_sort(array[0, middle])
  second_half = merge_sort(array[middle, array.size - middle])

  merge(first_half, second_half)
end

# array = [9, 5, 7, 1]
# merge_sort!(array, 0, array.size)
# p array

# p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# p merge_sort([5, 3]) == [3, 5]
# p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

# 14:53 -  quit gather before saving the code, reconstructed without the notes and algorithm
