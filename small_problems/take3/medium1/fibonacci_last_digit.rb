# Fibonacci Numbers (Last Digit)

=begin

Notes:

questions:

Problem:
input:
output:

  Write a method that returns the last digit of the
  nth Fibonacci number

rules:
  modulo (acc1 + acc2) % 10 each time you add
Examples:

15 -> 0
20 -> 5
100 -> 5
100_001 -> 1
1_000_007 -> 3
123456789 -> 4

DS:

Algorithm:
Given an integer nth
Set acc1 := 1
Set acc2 := 1
Iterate from 3 through nth
  Set temp := acc1
  acc1 = acc2
  acc2 = (acc2 + temp) % 10
Return acc2
=end

def fibonacci_last(nth)
  acc1 = 1
  acc2 = 1
  3.upto(nth) { acc1, acc2 = acc2, (acc1 + acc2) % 10 }
  acc2
end

# LS solution
def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10] # array constructors slow this down by ~30%
  end

  last_2.last
end


# The way I solved this was to write a Fibonacci method
# then wrote some driver code that used the method to output "the index: last digit of method return"
# This made me realise that the pattern would hold if i simply removed the highest-order
# digit once the number reached double-digits, so you could simply % 10 the result of every
# F(n - 1) + F(n - 2) addition operation (not that i was working recursively, just using math definition here)
# this pattern holds for any arithmetic sequence as far as I can see
# also seems to work for geometric sequences as far as i can tell
# and if you wanted the last two digits you would % 100, etc

# Further exploration
# I had a look using the same technique I used to find data for the original method
# and realised that last digit of F(60) is same as F(1) and the whole pattern repeats
# so nth % 60 at the start of the method should work
def fibonacci_last(nth)
  nth %= 60
  acc1, acc2 = 1, 1
  3.upto(nth) { acc1, acc2 = acc2, (acc1 + acc2) % 10 }
  acc2
end

# And using the same methods but with tail recursion seems very slightly faster
# than iterative for some reason
def fibonacci_last_tail(nth, acc1, acc2)
  return acc2 if nth <= 2
  fibonacci_last_tail(nth - 1, acc2, (acc1 + acc2) % 10)
end

def fibonacci_last(nth)
  nth %= 60
  fibonacci_last_tail(nth, 1, 1)
end

start = Time.now
p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
puts '--'
puts "Time: #{"%.10f" % (Time.now - start)} seconds"
