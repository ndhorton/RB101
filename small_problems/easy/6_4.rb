# def reverse!(list)
#   return list if list.empty?

#   i = 1
#   list_copy = []
#   loop do
#     list_copy << list[-i]
#     i += 1
#     break if i > list.length
#   end

#   j = 0
#   loop do
#     list[j] = list_copy[j]
#     j += 1
#     break if j >= list.length
#   end

#   list
# end

# LS solution
def reverse!(list)
  left_index = 0
  right_index = -1

  while left_index < list.size / 2
    list[left_index], list[right_index] = list[right_index], list[left_index]
    left_index += 1
    right_index -= 1
  end

  list
end
list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true