# Exclusive Or

=begin
Notes:

1  2  R   xor
f  f  f
t  f  t
f  t  t
t  t  f

!!(a && !b || !a && b)

Problem:
input: two values
output: boolean true or false

  Write an exclusive-or method that takes two values
  and returns boolean true if exactly one of the
  values is truthy, boolean false otherwise

rules:
  the return value must be a boolean

Examples and test cases:

false + true -> true
true + false -> true
true and true -> false
false + and false -> false

Data structures:

Algorithm:
Given two values, operand1 and operand2
If operand1 is true AND operand2 is false
  Return true
Else if operand1 is false AND operand2 is true
  Return true
Else
  Return false
=end

def xor?(operand1, operand2)
  !!(operand1 && !operand2 || !operand1 && operand2)
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# 8:51
