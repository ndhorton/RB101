# Fibonacci Numbers (Last Digit)

=begin

Thoughts:

try the largest number in the test case through the basic
iterative method from last exercise -- too slow

find pattern in Fibonacci number last digits

Problem:

Examples:

1 - 1
2 - 1
3 - 2
4 - 3
5 - 5
6 - 8
7 - 3
8 - 1
9 - 4
10 - 5
11 - 9
12 - 4
13 - 3
14 - 7
15 - 0
16 - 7
17 - 7
18 - 4
19 - 1
20 - 5

So the finding the last digit works on the same principle as finding
a Fibonacci number except you drop any digits higher-order than the
ones place value

So you need to modulo off anything >= 10

DS:

variable for first two fibonacci numbers
use array constructors and multiple assignment to swap

Algorithm:

Given an integer n
Set first := 1
Set last := 1
Iterate index from 3 through n
  sum = (first + last) % 10
  first = last
  last = sum
Return last

=end

def fibonacci_last(n)
  first = 1
  last = 1
  3.upto(n) { first, last = [last, (first + last) % 10] }
  last
end

# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4

# Further exploration

# PHI = (1 + Math.sqrt(5))/2

# def fibonacci(n)
#   (((PHI ** n) - ((1 - PHI) ** n))/Math.sqrt(5)).to_i
# end

# Above only works for n < 1475 before you get FloatDomainError

# The sequence of last digits of Fibonacci numbers repeats itself
# so that F(60) = F(0) = 0, F(61) = F(1) = 1, etc
# So if you set n := n % 60 immediately and then return 0 if n is 0
# the method then needs no other alterations to calculate much greater
# values of n

def fibonacci_last(n)
  n %= 60
  return 0 if n < 1
  first = 1
  last = 1
  3.upto(n) { first, last = [last, (first + last) % 10] }
  last
end

p fibonacci_last(123456789987745) == 5
p fibonacci_last(60) == 0
p fibonacci_last(61) == 1
p fibonacci_last(62) == 1
p fibonacci_last(63) == 2
p fibonacci_last(64) == 3
p fibonacci_last(65) == 5

p fibonacci_last(99999999999999999999999999999999999999999999999999999999999999999999999999999999)