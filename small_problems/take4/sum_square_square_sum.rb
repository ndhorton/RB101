# Sum Square - Square Sum

=begin
Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.
=end

=begin
Notes:

square_of_sum = add integers and then square the sum
sum_of_squares = square each integer and then add the squares
difference = square_of_sum - sum_of_squares

3
square_of_sum = 0
Iterate for current_number from 1 to 3 inclusive
  square_of_sum = square_of_sum + current_number
square_of_sum = square_of_sum * square_of_sum

sum_of_squares = 0
Iterate for current_number from 1 to 3 inclusive
  sum_of_squares = sum_of_squares + (current_number * current_number)
Return square_of_sum - sum_of_squares

Problem:
input: an integer
output:an integer

Write a method that accepts an integer, number_of_terms, and returns
the difference between the square of the sum of the first number_of_terms
positive integers and the sum of the squares of the first number_of_terms
positive integers

rules:
  e.g. if number_of_terms = 3, (1 + 2 + 3)^2 - (1^2 + 2^2 + 3^2)
  must be able to handle 1 -> 0
  do i need to check argument is positive integer? No

Examples and test cases:

(1)^2 - (1^2)

Data structures:

Algorithm:
Given an integer, number_of_terms
Set := square_of_sum = 0
Iterate for current_number from 1 to number_of_terms, inclusive
  square_of_sum = square_of_sum + current_number
square_of_sum = square_of_sum * square_of_sum

Set sum_of_squares := 0
Iterate for current_number from 1 to number_of_terms inclusive
  sum_of_squares = sum_of_squares + (current_number * current_number)
Return square_of_sum - sum_of_squares
=end

def sum_square_difference(number_of_terms)
  square_of_sum = 0
  1.upto(number_of_terms) do |current_number|
    square_of_sum += current_number
  end
  square_of_sum = square_of_sum ** 2

  sum_of_squares = 0
  1.upto(number_of_terms) do |current_number|
    sum_of_squares += current_number ** 2
  end
  square_of_sum - sum_of_squares
end

# LS solution
def sum_square_difference(n)
  sum = 0
  sum_of_squares = 0
  1.upto(n) do |number|
    sum += number
    sum_of_squares += number ** 2
  end
  sum ** 2 - sum_of_squares
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

# 12:03