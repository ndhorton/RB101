# Egyptian Fractions

=begin
Write two methods: one that takes a Rational number as an argument, and returns an Array of the denominators that are part of an Egyptian Fraction representation of the number, and another that takes an Array of numbers in the same format, and calculates the resulting Rational number. You will need to use the Rational class provided by Ruby.

=end

=begin

Notes:

Set denominator to 1
loop
  if rational's numerator is 1
    Add rational's denominator to denominators
    break from iteration
  while rational - 1/denominator < 0
    add 1 to denominator
  Add denominator to denominators
  rational = rational - 1/denominator

Problem:
input: a Rational
output: an array of integers

Write two methods
1) takes a Rational number as argument
and returns an array of integers
that when condidered as the denominators
of unit fractions, sum to the argument
2) a method that takes an array of denominators and returns the Rational sum of their unit fractions

rules:
  Use 1/1 as a valid term in an Egyptian fraction
  Largest input value is 3/1 for egyptian()

Examples / test cases:

2 / 1
denominator = 1
is 2/1 - 1/1 >= 0? yes
denoms [1], rational now 1/1
is 1/1 - 1/2 >= 0? yes
denoms [1, 2], rational now 1/2
is 1/2 - 1/3 >= 0 ? yes
denoms [1, 2, 3], rational now 1/6
is 1/6 - 1/4 >= 0? no
is 1/6 - 1/5 >= 0? no
is 1/6 - 1/6 >= 0? yes
denoms [1, 2, 3, 6], rational now 0

Data Structures:

Algorithm:
subprocess egyptian
Given a Rational, rat
Set denominator := 1
Set result := empty array
Iterate                    ### while rat > 0
  If rat's numerator == 1
    Append rat's denominator to result
    Break from iteration
  Iterate while rat - 1/denominator < 0
    Add 1 to denominator
  Append rat's denominator to result
  rat = rat - 1/denominator
  denominator = denominator + 1
Return result

subprocess unegyptian
given an array of integers, denominators
Set result := Rational(0, 1)
Iterate through each denominator in denomintors
  result = result + 1/denominator
Return result
=end

def unegyptian(denominators)
  denominators.reduce(Rational(0, 1)) do |acc, denominator|
    acc + Rational(1, denominator)
  end
end

def egyptian(rat)
  denominator = 1
  result = []
  loop do
    if rat.numerator == 1
      result << rat.denominator
      break
    end
    denominator += 1 while rat - Rational(1, denominator) < 0
    result << denominator
    rat -= Rational(1, denominator)
    denominator += 1
  end
  result
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

# 26:43
