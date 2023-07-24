# Egyptian Fractions

=begin

Notes:
questions:
  What is the largest rational number in the input range?
  The smallest?
  Is 1/1 really acceptable in an Egyptian fraction? (according to the
    example outputs it is considered so)

So given that 1/1 can be expressed as an Egyptian fraction with an
arbitrarily large denominator as its starting point, would it be possible to
do a recursive thing? You would need to pass a reference to the concatenated array
of all solved units expressed as Egyptian fractions to prevent repetition
Could get expensive fast.

Something like:

Given a rational number, rat_num
Set number := rat_num
Set whole_remainder := 0
Iterate while number > 1
  number -= 1
  whole_remainder += 1
Set unit_fractions = empty array
... iteratively solve Egyptian fraction for (fraction) number first ... (need to handle whole numbers <= 3 too though)
Iterate while whole_remainder > 0
  whole_remainder -= 1
  number = 1
  ... iteratively solve Egyptian fraction for number ...
Set output_denominators := transform each Rational element in unit_fractions to its denominator
Return output_denominators

Iteratively Solve Egyptian fraction <= 1
Set number := input_rat
Set current_denominator := denominator of number + 1
Until none of the denominators in unit_fraction are equal to current_denominator
  current_denominator += 1
Subtract 1/current_denominator from number
Append 1/current_denominator to unit_fractions array
If number has a numerator of 1 && sum of unit_fractions + number == input_rat
  break from iteration


The problem here is that if you have a fractional part:
  If unit_remainders == 0 && fractional_part.numerator == 1
    then solve for the fractional part
  Else
    simply add the fractional_part as the first denominator

Problem:
  1. Write a method that accepts a rational number as input and
     returns an array containing the denominators of an Egyptian fraction
     whose sum is equal to the input number
input: a rational number
output: an array containing only the denominators of the input number
        expressed as an Egyptian fraction

  2. Write a method that accepts an array of denominators and returns
     the rational number that is the sum of the unit fractions whose
     denominators are the numbers in the input array
input: an array of numbers
output: rational sum of unit fractions with input numbers as denominators

rules:
  The example tests only go as high in input value as 3/1
    and as low as 1/2
  
Examples:

DS:
variables:
  input_rat => the input number to the method
  unit_remainders => any whole units in the input
                      (this could be 0 if input_rat < 1/1)
  fractional_part => what's left of the input_rat - whole number if any
                     (this could be 0 if input_rat is a whole number)
  egyptian_denominators => array of Egyptian fraction denominators so far
  current_denominator
  current_unit => the unit we're working on to generate an acceptable Egyptian fraction

Algorithm:

Given a Rational number, input_rat
Set fractional_part := input_rat
Set unit_remainders := 0
Iterate while fractional_part > 1
  fractional_part -= 1
  unit_remainders += 1
Set denominators := empty array
Iterate
  Set current_denominator := denominator of fractional_part + 1
  Iterate until none of the denominators of unit_fractions == current_denominator
    current_denominator += 1
  fractional_part -= 1/current_denominator
  Append 1/current_denominator to denominators
  If numerator of fractional_part == 1 AND denominator NOT in denominators
    Append fractional_part denominator to denominators
      Break from iteration
=end

# require 'pry'

# def denominators_unit_or_less(denominators, fractional_part)
#   new_denominators = []
#   loop do
#     # break if fractional_part <= 0
#     current_denominator = 2
#     while denominators.include?(current_denominator) ||
#           (fractional_part.denominator == current_denominator &&
#           fractional_part.numerator == 1)
#       current_denominator += 1
#     end
#     fractional_part -= Rational(1, current_denominator)
#     denominators << current_denominator
#     if fractional_part.numerator == 1 &&
#       !((denominators + new_denominators).include?(fractional_part.denominator))
#       denominators << fractional_part.denominator
#       # binding.pry
#       break new_denominators
#     end
#   end
# end

# def egyptian(input_rat) # at the moment needs to be less than 1
#   fractional_part = input_rat
#   unit_remainders = 0
#   while fractional_part > 1
#     fractional_part -= 1
#     unit_remainders += 1
#   end

#   denominators = []
#   if fractional_part.numerator == 1 && unit_remainders > 0
#     denominators << fractional_part
#     fractional_part -= fractional_part
#   end

#   while unit_remainders > 0 || fractional_part > 0
#     denominators += denominators_unit_or_less(denominators, fractional_part)
#     if unit_remainders > 0
#       unit_remainders -= 1
#       fractional_part = Rational(1, 1)
#     end
#     break if denominators.map(&:to_r).sum == input_rat
#   end


#   unit_fractions = denominators.map { |denom| Rational(1, denom) }
#   puts unit_fractions.sum == input_rat # sanity check
#   denominators
# end

# p denominators_unit_or_less([], Rational(34, 34))
# p egyptian(Rational(35, 34))

=begin

Notes:
if input_rat > 1
  Then the first denominator will be 1 (for the purposes of this exercise)

questions:
  What is the largest rational number in the input range?
  The smallest?
  Is 1/1 really acceptable in an Egyptian fraction? (according to the
    example outputs it is considered so)

Problem:
  1. Write a method that accepts a rational number as input and
     returns an array containing the denominators of an Egyptian fraction
     whose sum is equal to the input number
input: a rational number
output: an array containing only the denominators of the input number
        expressed as an Egyptian fraction

  2. Write a method that accepts an array of denominators and returns
     the rational number that is the sum of the unit fractions whose
     denominators are the numbers in the input array
input: an array of numbers
output: rational sum of unit fractions with input numbers as denominators

rules:
  The example tests only go as high in input value as 3/1
    and as low as 1/2
  The example tests show that 1/1 is considered an acceptable unit fraction
    for this problem (nb: this doesn't appear to be the case in reality -- you're
    essentially finding a genuine Egyptian fraction for (input number - 1) in this case)

Examples:
irb(main):001:0> rat = 3/1r
=> (3/1)
irb(main):002:0> rat -= 1/1r
=> (2/1)
irb(main):003:0> rat -= 1/2r
=> (3/2)
irb(main):004:0> rat -= 1/3r
=> (7/6)
irb(main):005:0> rat -= 1/4r
=> (11/12)
irb(main):006:0> rat -= 1/5r
=> (43/60)
irb(main):007:0> rat -= 1/6r
=> (11/20)
irb(main):008:0> rat -= 1/7r
=> (57/140)
irb(main):009:0> rat -= 1/8r
=> (79/280)
irb(main):010:0> rat -= 1/9r
=> (431/2520)
irb(main):011:0> rat -= 1/10r
=> (179/2520)
irb(main):012:0> rat >= 1/15r
=> true
irb(main):013:0> rat >= 1/11r
=> false
irb(main):014:0> rat >= 1/12r
=> false
irb(main):015:0> rat >= 1/13r
=> false
irb(main):016:0> rat >= 1/14r
=> false
irb(main):017:0> rat >= 1/15r
=> true
irb(main):018:0> rat -= 1/15r
=> (11/2520)
irb(main):019:0> rat >= 1/16r
=> false
irb(main):020:0> rat >= 1/17r
=> false
irb(main):021:0> rat >= 1/229r
=> false
irb(main):022:0> rat >= 1/230r
=> true
irb(main):023:0> rat -= 1/230r
=> (1/57960)
irb(main):024:0> rat.denominator == 1
=> false
irb(main):025:0> rat.numerator == 1
=> true
irb(main):026:0> 

DS:

Algorithm:
Given a rational number, rat
Set remaining_value := rat
Set denominators := empty array 
If remaining_value is greater than 1
  Subtract 1 from input_rat
  Append 1 to denominators

Set denominator := 2
Iterate until numerator of remaining_value == 1
  Iterate until 1/denominator < remaining_value
    denominator += 1
  remaining_value -= 1/denominator
  Append denominator to denominators
  denominator += 1
Append denominator of remaining_value to denominators
Return denominators
=end

def egyptian(rat)
  remaining_value = rat
  denominators = []
  if remaining_value > 1/1r
    remaining_value -= 1/1r
    denominators << 1
  end
  current_denominator = 2
  loop do
    break if remaining_value.numerator == 1 &&
             !denominators.include?(remaining_value.denominator) # unnecessary second condition
    while Rational(1, current_denominator) > remaining_value
      current_denominator += 1
    end
    remaining_value -= Rational(1, current_denominator)
    denominators << current_denominator
    current_denominator += 1
  end
  denominators << remaining_value.denominator
end

def unegyptian(denominators)
  denominators.reduce(0) { |acc, denominator| acc + Rational(1, denominator) }
end

# LS solution
def egyptian(target_value)
  denominators = []
  unit_denominator = 1
  until target_value == 0
    unit_fraction = Rational(1, unit_denominator)
    if unit_fraction <= target_value
      target_value -= unit_fraction
      denominators << unit_denominator
    end

    unit_denominator += 1
  end

  denominators
end

def unegyptian(denominators)
  denominators.reduce(Rational(0)) do |accum, denominator|
    accum + Rational(1, denominator)
  end
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

# I think an interesting aspect of this exercise is deciding to solve
# the problem they give according to the test cases provided
# rather than trying to find a better solution that can find Egyptian
# fractions without using 1/1 or that can find fractions for target values much
# greater than 3 (or 2 if you don't use 1/1)
# Aside from anything, once you solve this easier problem, it's easier to
# go on to investigate better/more complicated algorithms, which may
# be extensions of rather than total revisions to this algorithm.
# My solution ended up being complicated by too much investigation
# and thinking about the math domain itself.
# The question: what is the actual problem at hand? is important.
