# Double Doubles

# input: a number
# number of digits: (Math.log10(3434)).floor + 1

# to get the two halves:

# number divmod (10 ** (number of digits / 2))

# algorithm:
# -given an integer, number
# -set digit_count = number of digits
# -set first_half = number divided by 10 **(number of digits / 2)
# -set second_half = number modulo 10 **(number of digits / 2)
# -if first_half == second_half
# --return number
# -else
# --return number * 2
# -end if

def twice(n)
  half_digits = ((Math.log10(n)).floor + 1) / 2
  first_half, second_half = n.divmod(10 ** half_digits)
  first_half == second_half ? n : n * 2
end

def twice(n)
  if n.to_s.length.even?
    half_digits = n.to_s.length / 2
    first_half = n.to_s[0, half_digits]
    second_half = n.to_s[half_digits, half_digits]
    first_half == second_half ? n : n * 2
  else
    n * 2
  end
end

# LS solution
def twice(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? ? '' : string_number[0..center - 1]
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10