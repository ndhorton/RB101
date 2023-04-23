# Stringy Strings

# input: an integer, n
# output: a string beginning with '1', then alternating '0' and '1', such the
# output string is n characters long
# goal: loop n number of times with a counter; if the counter is even, add '1' to
# the output string, '0' otherwise

# examples given

# Given an integer, n
# Set counter := 0
# Set bitstring := empty string
# For n times
#   If counter is even
#     Append '1' to bitstring
#   Else
#     Append '0' to bitstring
#   counter += 1
# Return bitstring

def stringy(n)
  bitstring = ''

  n.times do |counter|
    if counter % 2 == 0
      bitstring << '1'
    else
      bitstring << '0'
    end
  end

  bitstring
end

# LS solution

def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

# Further exploration

# Given an integer, size; another integer, mode, defaults to 1 but 0 can be optionally given
# If mode == 0
#   Set start_digit := 0
#   Set alternate_digit := 1
# Else
#   Set start_digit := 1
#   Set alternate_digit := 0
# Set bits := empty array
# Set index := 0
# Iterate while index < size
#   If index is even
#     Append start_digit to bits
#   Else
#     Append alternate_digit to bits
# Set bitstring := join(bits) -> string
# Return bitstring

def stringy(size, mode = 1)
  start_digit = mode.zero? ? 0 : 1
  alternate_digit = mode.zero? ? 1 : 0
  bits = []

  size.times do |index|
    bits << (index.even? ? start_digit : alternate_digit)
  end

  bits.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'

