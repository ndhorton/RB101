# Sequence count

=begin
input: two integers, count and base
output: an array of count size containing multiples of base
goal: create empty array and, count times, append increasing multiples of base

implicit: though count will not be negative it can be zero, in which case
  return empty array
if base is negative, increasingly negative multiples

algorithm:
-given two integers, count and base
-set mutltiples = empty array
-repeat count number of times with counter
--multiply base * counter (+ 1 if counter begins at 0)
--append returned value to multiples
-return multiples

=end

# def sequence(count, base)
#   multiples = []
#   1.upto(count) { |counter| multiples << (base * (counter)) }
#   multiples
# end

# def sequence(count, base)
#   multiples = []
#   count.times { |counter| multiples << (base * (counter + 1)) }
#   multiples
# end


def sequence(count, base)
  Array.new(count).map.with_index(1) { |_, idx| base * (idx) }
end

# LS solutions

# def sequence(count, base)
#   multiples = []
#   current_multiple = base

#   count.times do
#     multiples << current_multiple
#     current_multiple += base
#   end

#   multiples
# end

# def sequence(count, base)
#   (1..count).map { |value| value * base }
# end

# Remember you can map a range to a new Array like this
# Remember that Enumerator#with_index can take an argument representing the start
# value of the index (default is 0)
# Remember the Integer#times method cannot take such an argument, so that
# if you need the number to start somewhere other than 0, you should use Integer#upto

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []