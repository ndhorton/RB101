# Getting Things Done

# My solution is totally wrong, I forgot to check the examples again
# after I'd written it. I was investigating whether it was adding
# nils to the to_array and that distracted me from what the method ought to
# do when I was writing the base case. Keep the examples/goal in mind before
# thinkining you've finished. I debugged it and added a new bug.
#
# def move(n, from_array, to_array)
#   return if from_array.empty?
#   to_array << from_array.shift
#   move(n - 1, from_array, to_array)
# end

# LS solution

# def move(n, from _array, to_array)
#   return if n == 0
#   to_array << from_array.shift
#   move(n - 1, from_array, to_array)
# end

# Further Exploration
# If the length of the from_array is smaller than n,
# then (n - from_array.size) nils will be added to
# the to_array. Adding the OR condition below prevents this.

def move(n, from_array, to_array)
  return if n == 0 || from_array.empty?
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach']
