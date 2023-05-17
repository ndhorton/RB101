# Combining Arrays

# input: two arrays, arr1 and arr2
# output: a new array containing all unique values from arr1 and arr2

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

# LS solution uses the `|` Array union operator (like `Array#union` but
# only takes one argument)

def merge(array1, array2)
  array1 | array2
end

def merge(array1, array2)
  merged_array = []
  array1.each { |element| merged_array << element unless merged_array.include?(element) }
  array2.each { |element| merged_array << element unless merged_array.include?(element) }
  merged_array
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
