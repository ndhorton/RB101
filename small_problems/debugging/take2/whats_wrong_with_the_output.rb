# What's Wrong With the Output?

=begin

So the descending output is working but it's sorting by
the `String#<=>` method even though `String#to_i` has
been called on both elements

After playing around with `x` and `y` etc
it suddenly occurred to me that it was passing the
block intended for the `sort` method to `p` instead.
The `sort` method was thus being called without a block
and so retained the default sort order and default
comparison criterion (`String#<=>`).

To fix this I simply placed parentheses around the entire
method invocation including the `do...end` block.

"the `p` and `arr.sort` bind more tightly because of Ruby's
precedence rules" -- LS solution

=end

arr = ["9", "8", "7", "10", "11"]
p( # remember this formatting
  arr.sort do |x, y|
    y.to_i <=> x.to_i
  end
)

# Another solution - LS
p arr.sort { |x, y| y.to_i <=> x.to_i }

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 