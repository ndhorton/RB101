def multiply(num1, num2)
  num1 * num2
end

p multiply(5, 3) == 15

# further exploration

arr = ['shoe', 3, 5]
p arr.object_id
arr2 = multiply(arr, 3)
p arr2
p arr2.object_id
p arr2[0].object_id
p arr2[3].object_id
arr2[3] << 'store'
p arr2

# calling * on an array with an integer as the other operand produces
# a new array with all the original members repeated in the same order
# as many times as the integer specifies. the element copies are copies of the
# object ids however rather than the creation of new clone objects