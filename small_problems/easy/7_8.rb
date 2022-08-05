# def multiply_list(array1, array2)
#   array1.map.with_index { |n, i| n * array2[i] }
# end

# def multiply_list(array1, array2)
#   array1.zip(array2).map { |tuple| tuple[0] * tuple[1] }
# end

def multiply_list(array1, array2)
  array1.zip(array2).map { |tuple| tuple.inject(:*) }
end


# def multiply_list(array1, array2)
#   array1.zip(array2).map { |(a, b)| a * b  }
# end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# input: two arrays of equal size containing numbers
# output: a new array containing the product of multiplying each number in
# the first array with the number at the corresponding index of the second array

# algo:

# -given two arrays, array1 and array2
# -iterate over array1 with index
# --multiply each number by the number at the corresponding index of the second array
# --append to a new array
# -return new array