# Multiply All Pairs

# Given two arrays, list1, list2
# Set products := empty array
# Iterate over each element1 in list1
#   Iterate over each element2 in list2
#     Push to products the product of element1 and element2
# Sort products
# Return products

def multiply_all_pairs(list1, list2)
  list1.product(list2).map { |pair| pair.reduce(:*) }.sort
end

def multiply_all_pairs(list1, list2)
  products = []
  list1.each do |element1|
    list2.each { |element2| products << element1 * element2 }
  end
  products.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
