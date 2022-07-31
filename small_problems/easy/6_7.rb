# input: an array
# output: two arrays (nested), the first containing the first half of the input array
# and the middle element if there are an odd number, the second containing the rest

# implicit requirements:
# examples show you need to account for arrays smaller than 2 including empty arrays

# algo:

# -given an array
# -set split_array = empty array
# -if array odd
# --slice from first index to half the array size + 1
# --push onto split_array
# --slice from index number half the array size + 2 until half array size
# --push onto split_array
# -if array even
# --slice from first index to half the array size
# --push onto split_array
# --slice from index number half the array size + 1 until half array size
# --push onto split_array
# -return split_array

# def halvsies(arr)
#   split_arr = []
#   half = arr.size / 2
#   if arr.size.even?
#     split_arr << arr.slice(0, half)
#     split_arr << arr.slice(half, half)
#   else
#     split_arr << arr.slice(0, half + 1)
#     split_arr << arr.slice(half + 1, half)
#   end
#   split_arr
# end

# LS solution
# def halvsies(arr)
#   half = (arr.size / 2.0).ceil
#   first_half = arr.slice(0, half)
#   second_half = arr.slice(half, arr.size - half)
#   [first_half, second_half]
# end

# def halvsies(arr)
#   [arr[0, (arr.size / 2.0).ceil], arr[(arr.size / 2.0).ceil, arr.size / 2]]
# end

def halvsies(arr)
  len = arr.size
  return [arr, []] if len < 2
  half = (len / 2.0).ceil
  first_half = []
  second_half = []

  i = 0
  loop do
    first_half << arr[i]
    i += 1
    break if i >= half
  end

  j = half
  loop do
    second_half << arr[j]
    j += 1
    break if j >= len
  end

  [first_half, second_half]
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]