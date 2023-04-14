# What's wrong with the output?

# The problem is that the `Kernel#p` method has greater
# precedence than a `do...end` block when the interpreter
# interprets this line of code (line 2); so the block is being
# given to the `p` method (which ignores it) rather than 
# the `sort` method for which a block is optional. So the
# `sort` method is called on `arr` without a block and
# returns the array sorted in default ascending order by 
# the `String#<=>` method rather than the reverse ordering and
# use of the `Integer#<=>` method which the block attempts to deploy.
# The default-sorted return value is then passed to `p` along with
# the block and is printed to the screen.

# The solutions are either to use a `{...}` block which has
# high enough precedence to be successfully passed to `sort`
# or to wrap the entire argument to `p` including the block
# in parentheses. Another solution would be to capture the return
# value of `sort` with the block with a variable and pass that
# variable to `p` in a separate statement.

# arr = ['9', '8', '7', '10', '11']
# p (arr.sort do |x, y|
#   y.to_i <=> x.to_i
# end)

# arr = ['9', '8', '7', '10', '11']
# p arr.sort { |x, y| y.to_i <=> x.to_i }

# LS solution - I assume this is good style for the parentheses
# maybe check the style guide
# arr = ['9', '8', '7', '10', '11']
# p (
#   arr.sort do |x, y|
#   y.to_i <=> x.to_i
# end
# )

# The explanation given by LS for what's happening seems different
# from the course material. (RB101 - Lesson 2: Precedence)
# (although they do say here, "The Ruby documentation does have 
# information on precedence, but this particular behavior isn't covered very well.
# Our main reason for showing it is that this issue comes up time and again with students.")

def p(value)
  puts value.inspect
  puts yield(1, 2)
end

arr = ['9', '8', '7', '10', '11']

p arr.sort do |x, y|
  y.to_i <=> x.to_i
end

# outputs the return value of the block after the return value of `arr.sort`

# This seems to demonstrate that the Lesson 2 explanation is
# the correct one, the block is passed to the `p` method and ignored.
# Further, attempting to define a block on something other than a method invocation
# results in a syntax error so I don't think it's plausible that the interpreter
# is passing the block to the returned array.
