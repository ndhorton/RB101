# Combine Two Lists

# input: two equally-sized non-empty arrays
# output: an array combining the two arrays so that the first element from
# the first array is followed by the first element of the second array, and so on

# algo:
# -given array1 and array2
# -set interleaved_array = empty array
# -loop until counter == size of arrays
# --push element in array1 at that counter index onto interleaved_array
# --push element in array2 at that counter index onto interleaved_array
# -return interleaved_array

# def interleave(array1, array2)
#   interleaved_array = []
#   arrays_length = array1.size

#   i = 0
#   loop do
#     break if i >= arrays_length
#     interleaved_array << array1[i]
#     interleaved_array << array2[i]
#     i += 1
#   end

#   interleaved_array
# end

# # LS solution
# def interleave(array1, array2)
#   result = []
#   array1.each_with_index do |element, index|
#     result << element << array2[index]
#   end

#   result
# end

# Further exploration
def interleave(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']