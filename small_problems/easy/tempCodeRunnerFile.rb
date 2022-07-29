def reverse(arr)
  reversed_arr = []
  i = -1

  while i >= -(arr.size)
    reversed_arr << arr[i]
    i -= 1
  end

  reversed_arr
end
