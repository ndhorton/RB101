# Mutation

# After `array1` has been initialized to an array of string objects and `array2` has
# been initialized to a new empty array object, the `each` method is invoked for the
# first time on `array1` with a block. This `each` call iterates through `array1` passing
# each string element in turn to the block to be assigned to the block parameter `value`.
# The only statement in the block pushes the element currently referenced by `value` to
# `array2` using the `Array#<<` method. The result of this `each` call is to make `array2`
# a shallow copy of `array1`; the arrays are different objects but each of their elements
# is a reference to the same string objects shared between the arrays.
# The second `each` call is again a call on `array1`; the block calls the mutating `String#upcase!`
# method on elements in `array1` that start with an `'S'` or a `'C'`. This operation mutates
# the string objects in memory and so this change in state will be reflected by the elements
# of both `array1` and `array2`.
# So when `array2` is passed to the `Kernel#puts` method on line 5, the output will reflect the
# mutations performed by the second `each` call:
# ```
# Moe
# Larry
# CURLY
# SHEMP
# Harpo
# CHICO
# Groucho
# Zeppo
# ```

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# LS
# 'the first `each` loop simply copies a bunch of references from `array1` to `array2`. When
# that first loop completes, both arrays nopt only contain the same values, they contain the
# same String objects. If you modify [mutate] one of those Strings, that modification will show
# up in both Arrays'

# Further exporation
# This feature of Ruby will cause problems if you want an entirely seperate copy of a collection
# whose elements you want to mutate without affecting the elements of the original collection.
# If you only make a shallow copy, then you could inadvertantly lose the original data referenced
# by the original collection by calling mutating methods on the elements of the copy.
# To avoid this, you can make a deep copy by calling either the `clone` or `dup` method on
# each individual element of the original array. So the `each` call that populates `array2`
# from this exercise would look like:

array1.each { |value| array2 << value.dup }
