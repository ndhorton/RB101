# Sum Square - Square Sum

=begin

Thoughts:

Question: should i validate n? Can i assume it is a positive integer?

Problem:
Write a method that
  1) calculates the square of the sum of the first n positive integers
  2) calculates the sum of the squares of the first n positive integers
  3 calculates (1) - (2)


Examples:

if n is 3
  1) square_of_sum = (1 + 2 + 3) ** 2 == 36
  2) sum_of_squares = (1 + 4 + 9) == 14
  3) 36 - 14 == 22

DS:

Algorithm:

Given a positive n
Set sum := 0
Iterate for each num from 1 through n
  sum += num
Set square_of_sum := sum * sum

Set sum_of_squares := 0
Iterate for each num from 1 through n
  sum_of_squares += (num * num)

Return square_of_sum - sum_of_squares

=end

def sum_square_difference(n)
  sum = 0
  1.upto(n) { |num| sum += num }
  square_of_sum = sum ** 2

  sum_of_squares = 0
  1.upto(n) { |num| sum_of_squares += num ** 2 }

  square_of_sum - sum_of_squares
end

# LS solution - only iterates once
def sum_square_difference(n)
  sum = 0
  sum_of_squares = 0

  1.upto(n) do |value|
    sum += value
    sum_of_squares += value**2
  end

  sum**2 - sum_of_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

# 18:48 - somehow added a 1 to the end of the last test case's expected return value
# and spent about 5 minutes thinking the false result was because I had to optimize
# for large `n` inputs until I realised that the test case was wrong
# Also, I worked through the first answer without noticing that the comment
# already did that