require 'pry'

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

i = 0
loop do
  break if i >= arr.size
  current_value = arr[i]
  binding.pry
  i += 1
end