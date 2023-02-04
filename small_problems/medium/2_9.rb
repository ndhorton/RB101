# Bubble sort

# Optimization 1

# def bubble_sort!(array)
#   n = array.size
#   loop do
#     swapped = false
#     1.upto(n-1) do |i|
#       if array[i-1] > array[i]
#         array[i-1], array[i] = array[i], array[i-1]
#         swapped = true
#       end
#     end
#     n -= 1
#     break unless swapped
#   end
#   array
# end

# Optimization 2

def bubble_sort!(array)
  n = array.size
  loop do
    new_n = 0
    1.upto(n-1) do |i|
      if array[i-1] > array[i]
        array[i-1], array[i] = array[i], array[i-1]
        new_n = i
      end
    end
    n = new_n
    break if n <= 1
  end
  array
end

# LS solution
# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
#   nil
# end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)