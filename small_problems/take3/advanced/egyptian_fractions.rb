# Egyptian Fractions

=begin

Notes:

questions:

Problem:
input:
output:

  Write 1 method that takes a Rational number and returns
  an array of the demoninators of an Egyptian fraction representation
  of that number

  Write 1 method that takes an array of numbers like those produced above
  and sums their reciprocals into a single Rational sum

rules:
  you can use 1/1

Examples:

2/1
so i guess, if input > 1
  divide input by 2 and add 1/1
1/1 / 2

DS:

Algorithm:
Given a rational, rat
Set denominators := empty array
Set current_denominator := 1
Iterate while rat > 0
  While rat - 1/current_denominator < 0
    Increment denominator
  Subtract from rat the unit fraction with current_denominator
  Append current_denominator to denominators
  Increment denominator
Return denominators
=end

def egyptian(rat)
  denominators = []
  current_denominator = 1
  while rat > 0 
    current_denominator += 1 while Rational(1, current_denominator) > rat
    rat -= Rational(1, current_denominator)
    denominators << current_denominator
    current_denominator += 1
  end
  denominators
end

def unegyptian(denominators)
  denominators.reduce(0/1r) do |sum, denominator|
    sum + Rational(1, denominator)
  end
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

# 33:41
