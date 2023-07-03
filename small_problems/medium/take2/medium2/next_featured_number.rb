# Next Featured Number Higher than a Given Value

=begin

Thoughts:

7 14 21 28 35 42 49 56 63 70

x + (7 - (x % 7)) would give you the next multiple of 7
thereafter you could iterate by 7s
until number is odd && digits_unique?(number)

9_876_543_210 is the highest number with unique digits
This is 2 higher than a multiple of 7
subtract 2 and the number is still even
subtract 7 and the number is odd AND contains all unique digits
Therefore,
9_876_543_201 is highest featured number

Problem:

input: an integer
output: the next featured number > input number OR
        error message if there is no next featured number

rules: Let a 'featured number' be 
      1  an odd number
      2  a multiple of 7
      3  digits must be unique

It follows from (3) that 
      the limit for returning an error message is when
      the test number for return reaches 11 digits long
      at which point there can be no more featured numbers

      Must be greater than argument

Error message must be: "There is no possible number that fulfills those requirements"
Examples:

49 - featured
98 - not featured (not odd)
97 - not featured (not a multiple of 7)
133 - not featured (not unique digits)

next number after 9_999_999_999 does not exist?
if you have 11 digits, they cannot be unique

DS:

Algorithm:

Subroutine digits_unique?(int num)
Set digits := split(String(num))
Return (digits == unique(digits))

Given an integer, number
number = number + (number % 7) to give the next multiple of 7
if number is even
  number += 7
end if
Iterate until number > 9_876_543_201
  if digits_unique?(number)
    return number
  end if
  number += 14
End iteration
return "There is no possible number that fulfills those requirements"

=end

HIGHEST_FEATURED_NUMBER = 9_876_543_201

def featured(number)
  number = number + (7 - (number % 7))
  number += 7 if number.even?
  loop do
    break if number > HIGHEST_FEATURED_NUMBER
    digits = number.to_s.chars
    return number if digits == digits.uniq
    number += 14
  end
  "There is no possible number that fulfills those requirements"
end

# LS solution
def featured(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements