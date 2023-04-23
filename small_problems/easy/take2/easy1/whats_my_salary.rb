# What's my salary?

# input: positive integer, salary, and boolean, bonus_awarded
# output: if bonus_awarded is true, return float 1/2 * salary; 0.0 otherwise

# Given an integer, salary, and a boolean, bonus_awarded
# If bonus_awarded == true
#   Return float_division(salary / 2)
# Else
#   Return 0.0

def calculate_bonus(salary, bonus_awarded)
  bonus_awarded ? salary.fdiv(2) : 0.0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
