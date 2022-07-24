# Odd lists

def oddities(input_list)
  output_list = []
  input_list.each_with_index do |elem, idx|
    output_list << elem.dup if idx.even?
  end
  output_list
end

# def oddities(input_list)
#   input_list.select.with_index {|elem, idx| idx.even? }
# end

# def oddities(input_list)
#   output_list = []
#   i = 0
#   while i < input_list.size
#     output_list << input_list[i]
#     i += 2
#   end
#   output_list
# end

# def evenities(input_list)
#   output_list = []
#   i = 1
#   while i < input_list.size
#     output_list << input_list[i]
#     i += 2
#   end
#   output_list
# end

# def evenities(input_list)
#   input_list.select.with_index { |elem, i| i.odd? }
# end

def evenities(input_list)
  output_list = []
  input_list.each_with_index do |elem, idx|
    output_list << elem.dup if idx.odd?
  end
  output_list
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

# arr = ['ape', 'eel', 'lizard']
# p "initial object id of first element: #{arr[0].object_id}"
# arr2 = oddities(arr)
# p "returned array object id of first element: #{arr2[0].object_id}"

p evenities([2, 3, 4, 5, 6]) == [3, 5]
p evenities(['abc', 'def']) == ['def']