# Multiplying Two Characters

def multiply(a, b)
  a * b
end

p multiply(3, 5)
p multiply([1, 2, 3], 2)

# If the argument passed to be assigned to parameter `a` is an array,
# the `Array#*` method returns a new array whose elements are those from
# the caller repeated `b` number of times. In the case of a mutable object,
# it is important to remember than the repeated elements will be the same
# objects with the same object id as the elements from the caller, not copies.