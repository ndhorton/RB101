# Exclusive Or

=begin

truth table:

P & Q false
!P & Q true
P & !Q true
!P & !Q false

!!(p && !q || !p && q)   # the !! does seem to be needed for certain situations
                         # to prevent the expression returning a truthy value
                         # instead of Boolean object `true`
However the above can be simplified if the right hand operand of the
second expression also has the unary Not operator applied (which means switching
the order of operands), i.e.

p && !q || q && !p

However, this is perhaps more confusing to read and the logic of writing it this
way might be lost on whoever sees it later (including yourself)

=end

def xor?(p, q)
  p && !q || q && !p
end

# LS solutions

def xor?(value1, value2)
  return true if value1 && !value2
  return true if !value1 && value2
  false
end

def xor?(value1, value2)
  !!((value1 && !value2) || (!value1 && value2))
end

def xor?(value1, value2)
  !!value1 ^ !!value2
end

def xor?(value1, value2)
  !!value1 == !value2
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false