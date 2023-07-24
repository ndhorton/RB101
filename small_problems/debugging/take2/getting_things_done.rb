# Getting Things Done

=begin

A `SystemStackError` means that the stack has overflowed, here
most likely through too many recursive calls pushing too many
stack frames onto the call stack.

Why does this code produce a `SystemStackError`?

There is no base case in the recursive `move` method, so after
the `from_array` has been exhausted of elements, the method continues
to call itself, each time pushing a `nil` -- returned by calling
`Array#shift` on the empty `from_array` -- to the `to_array`.
The method then calls itself again and again until the stack
overflows.

In order to fix this, we need to understand what the base case would
be. Since `n` is decremented each time the recursive call is made,
it works out that once the method receives an `n` value of zero, the
correct number of elements have 

Since the purpose is to move `n` elements, we could simply
iterate `n` times, moving an element each time, and return without
any recursive calls at all. (Or simply use a method like `slice!`
to move them all at once).

This method performs a destructive action on one of its arguments
so by convention, it might be better to call it `move!` to signal
this.

=end

def move(n, from_array, to_array)
  return if n.zero?
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Further exploration
# If the length of the `from_array` is smaller than `n`
# then, as things stand, the difference will be made up
# with `nil` objects returned by calling `shift` on an
# empty array. To prevent this, we would need to decide
# on what to do if this happens. We could simply check
# if `n` exceeds the size of the `from_array` and if so
# then we reassign `n` to the size of the `from_array`:
def move(n, from_array, to_array)
  return if n.zero?
  n = from_array.size if n > from_array.size
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

# move(2, todo, done)

# Further exp test
move(48, todo, done)
# should give:
# []
# ["apply sunscreen", "go to the beach", "study", "walk the dog", "coffee with Tom"]


p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']