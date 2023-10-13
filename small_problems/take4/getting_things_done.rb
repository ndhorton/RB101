# Getting Things Done

def move(n, from_array, to_array)
  return if n <= 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

def iterative_move(n, from_array, to_array)
  n.downto(1) { |_| to_array << from_array.shift }
end

def move(n, from_array, to_array)
  return if n < from_array.size # or raise exception, etc...
  to_array.concat(from_array.shift(n))
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
