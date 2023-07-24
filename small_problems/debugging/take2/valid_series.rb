# Valid Series?

=begin

purpose:
  the method should check if a series is valid, which means
  there are exactly 3 odd numbers in the series
  the series sums to 47

The condition for the ternary expression on the final line
of the method body is currently a reassignment rather than
a check for equality.
--
Maybe important to say that it will always evaluate as `true`
because the variable is assigned to an Integer, which, like
every object in Ruby except for `false` and `nil`, is 
considered truthy in a Boolean context.
--
The method should work correctly if the line began
`odd_count == 3`.
After correcting this, since the ternary expression here
only returns `true` if the condition evaluates to `true`
and `false` if the condition evaluates to `false`, we can simplify
things by removing the ternary operator and returning the return value
of the condition itself (the equality comparison operator)

=end

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false