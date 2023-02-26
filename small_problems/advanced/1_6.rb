# Fix the Bug

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# Since there seems to be a missing conditional expression
# following the elsif keyword, the `map` invocation with block is treated as
# a conditional expression and one that always evaluates as truthy, since map
# will return an array (as long as the argument given is an enumerable collection)
# and arrays are truthy (like every object except for `nil` and `false`)

# The `if` branch is followed for an empty array, since the `if` comes before the 
# defective `elsif`, so the `my_method` invocation with a given empty array returns
# an empty array as it is supposed to. However, the `else` branch will never be reached

# Since the `map` invocation is the only expression before the `else` keyword, this
# means there are no expressions to be evaluated within the body of the `elsif` branch,
# so the overall `if/elsif/else` expression returns `nil`. This is the last evaluated
# value in the method, so `my_method` also returns `nil` (if it has not been given
# an empty array).

# Since the expected results appear to be:
# for an empty array, return an empty array OR
# for an array larger than 1 element, a new array with all elements in the argument array squared OR
# for an array of 1 element, a new array with the sole element multiplied by 7

# all that is needed to achieve the expected results is to add the conditional expression
# `array.size > 1` after the `elsif` keyword, and the method will function as expected;
# the `map` invocation will return a value from the method instead of being used
# as a conditional check.
