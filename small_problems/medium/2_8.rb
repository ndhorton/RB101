# Next Featured Number Higher than a Given Value

=begin
input: an integer
output: a number higher than the input that is an odd multiple of 7 and
each of whose digits are unique in its digit string
UNLESS input number is >= 9_999_999_999
THEN 'There is no possible number that fulfills those requirements'

integer / 7 * 7 + 7
is this a featured number?
if not add 7
is this a featured number?
etc
set featured_number = nil
until featured_number
  ... 

algorithm
given an integer n
if n >= 9_999_999_999
  return 'There is no possible number that fulfills those requirements'
set current_number = nearest multiple of 7 <= n
repeat until a featured number is found
  add 7 to current_number
  if current_number is odd AND each digit is unique
    set featured_number = current_number
=end

def featured(number)
  if number >= 9_999_999_999
    return 'There is no possible number that fulfills those requirements'
  end

  current_number = number.truncate / 7 * 7
  featured_number = nil
  until featured_number
    current_number += 7
    number_digits = current_number.digits
    if current_number.odd? && number_digits.uniq == number_digits
      featured_number = current_number
    end
  end

  featured_number
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

  'There is no possible number that fulfills those requirements'
end



p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
