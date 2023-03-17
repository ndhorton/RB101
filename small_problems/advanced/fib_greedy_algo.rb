# Fibonacci's Greedy Algorithm for Egyptian Fractions
# For this algorithm, a starting number that is already a unit
# fraction is considered already solved so this
# algorithm is for t/b where t>1
# also only works for proper fractions

# Given a rational number, rat
# Set units = empty array
# Set remain = rat
# While sum of units elements NOT equal to rat
#   Set denom = ceiling(remain's denominator / ramain's numerator) 
#   Set unit = rational number 1/denom
#   Push unit to units
#   remain = remain - unit
# Transform units such that each element = element denominator
# Return units

def egyptian(rat)
  units = []
  remain = rat

  while units.sum != rat
    unit = Rational(1, remain.denominator.fdiv(remain.numerator).ceil)
    units << unit
    remain  = remain - unit
  end
  units.map { |fract| fract.denominator }
end

def unegyptian(list)
  sum = list.reduce(Rational(0,1)) do |acc, denom|
    acc + Rational(1, denom)
  end
end

p egyptian(Rational(2,3))
# p unegyptian(egyptian(Rational(521, 1050)))
