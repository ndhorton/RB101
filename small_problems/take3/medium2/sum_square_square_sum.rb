# Sum Square - Square Sum

=begin

Notes:

questions:
do i need to check the argument is a positive integer? No

Problem:
input: a positive integer, n
output: (square of sum of first n integers) - (sum of squares of first n integers)

  Write a method that computes the difference between the square of the sum
  of the first n positive integer
  and the sum of the squares of the first n positive integers

rules:
  the arguemnt will be a positive integer

Examples:

3
1 2 3
(1 + 2 + 3)^2 = 36
(1 + 4 + 9) = 14
36 - 14 = 22

DS:

Algorithm:
Given an integer, n
Set square_of_sum := 0
Set sum := 0
Iterate for 1 upto n inclusive, current_number
  sum = sum + current_number
  sum_of_squares = sum_of_squares + (current_number * current_number)
square_of_sum = sum * sum
Return square_of_sum - sum_of_squares
=end

def sum_square_difference(n)
  sum_of_squares = 0
  sum = 0
  1.upto(n) do |current_number|
    sum += current_number
    sum_of_squares += current_number * current_number
  end
  square_of_sum = sum * sum
  square_of_sum - sum_of_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

# 9:35
