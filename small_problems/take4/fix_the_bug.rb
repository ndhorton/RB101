# Fix the Bug

=begin

the `elsif` control expression on line 4 is not followed by an obvious
conditonal expression; presumably it has been left out. Instead, the
following line, a call to Array#map, is evaluated as though it were the
conditon for the `elsif` expression, and since `map` always returns an array
and an Array object is considered truthy by Ruby, this branch will always
be followed if the `if` condition evaluates as false.
Since there is no code remaining in the branch once the `map` call has been
evaluated as the condition, this branch will always return `nil`, and `my_method`
will then return `nil`.
In order to fix this and return the appropriate values according to the expected
output, one could add as the `elsif` condition, on line 4,
elsif array.size > 1

This way every array with more than 1 element will have its elements transformed
to their squares, while an array with only 1 element will have its element
multiplied by 7 in the `else` branch on line 9.

expected:
[]
[21]
[9, 16]
[25, 36, 49]

=end

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
