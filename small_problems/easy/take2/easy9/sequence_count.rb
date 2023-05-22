# Sequence Count

# input: two integers, count and number
# output: an array with count multiples of number 
# from (number * 1) to (number * count)

# Given two integers, count and number
# Set multiples := empty array
# Iterate for each factor from 1 to count
#   Push (factor * number) to multiples
# Return multiples

def sequence(count, start_term)
  multiples = []
  1.upto(count) { |factor| multiples << (factor * start_term) }
  multiples
end

# LS solutions
# map will actually return an empty array if called on an uniterable range (1..0)
def sequence(count, first)
  (1..count).map { |value| value * first }
end

# def sequence(count, first)
#   sequence = []
#   number = first

#   count.times do
#     sequence << number
#     number += first
#   end

#   sequence
# end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
