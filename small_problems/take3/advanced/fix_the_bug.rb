# Fix the Bug

=begin

The `elsif` expression has no obvious deliberate conditional expression on line 4
This means, however, that whatever comes next, on line 5, acts as the conditional
expression. Since this will be the new array object returned by the `map` invocation
this accidental conditional expression will always be true. Yet since there
is no remaining expression before the `else` control expression on line 8,
the `elsif` branch returns `nil` and since there is no code after the
overall `if/elsif/else` control expression, the `my_method` method will implicitly
return this `nil`.

To fix this, so that the output matches the expected output, 
which shows that
  0 elements in the argument array returns an empty array
  1 element in the argument array returns an array with that element
    multiplied by 7
  > 1 elements returns an array with the elements from the caller squared
we can add the condition, on line 7:
```ruby
elsif array.size > 1
```
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

# 10:24