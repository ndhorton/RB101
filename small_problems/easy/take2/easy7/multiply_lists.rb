# Multiply Lists

def multiply_list(list1, list2)
  list1.map.with_index { |element, index| element * list2[index] }
end

# LS solution

def multiply_list(list1, list2)
  products = []
  list1.each_with_index do |item, index|
    products << item * list2[index]
  end
  products
end

def multiply_list(list1, list2)
  products = []
  list1.size.times do |index|
    products << list1[index] * list2[index]
  end
  products
end

def multiply_list(list1, list2)
  list1.zip(list2).map { |sublist| sublist.reduce(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
