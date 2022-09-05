# Multiply all pairs

# input: two lists of numbers
# output: a new list in ascending value order in which each number is the product
# of each number in the first collection multiplied by each number in the second collection

# neither input array is empty

# no special allowance needs by made for zeros or negative numbers

# algorithm:

# -given two arrays, list1 and list2
# -set products = empty array
# -iterate over each number x in list1
# --iterate over each number y in list2
# ---append to products the product of x * y
# -sort products in ascending value order
# -return products

# def multiply_all_pairs(list1, list2)
#   products = []
#   list1.each do |num1|
#     list2.each do |num2|
#       products << num1 * num2
#     end
#   end
#   products.sort
# end

# LS solution

def multiply_all_pairs(list1, list2)
  list1.product(list2).map { |num1, num2| num1 * num2 }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]