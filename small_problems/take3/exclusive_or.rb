# Exclusive Or

=begin

Notes:

P Q =
t t f
t f t
f t t
f f f

(arg1 && !arg2) || (!arg1 && arg2)

questions:


Problem:
input: two arguments of any class
output: a Boolean object true or false

  Write an xor method that returns Boolean object `true` if
  only one of its two arguments is truthy, `false` otherwise

rules:
  The arguments can be merely truthy and/or falsey but the method must
    return Boolean objects `true` or `false`
Examples:

false and !true || (!false && true)
true and !false || (!true && false)
true and !true  || (!true && true)
false and !false || (!false && false)

DS:

Algorithm:

=end

def xor?(p, q)
  !!((p && !q) || (!p && q))
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# 9:04

# notes: didn't remember the `?` on the method name
#        forgot to wrap whole expression in parentheses to attach the `!!`
#        to the whole thing rather than the first `(p && !q)`
