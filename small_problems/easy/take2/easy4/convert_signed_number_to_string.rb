# Convert signed number to a string!

# START
# Given an integer, number
# If number < 0
#   Set negative := true
#   number *= -1
# Else
#   Set negative := false
# End if

# Set digit_string := integer_to_string(number)

# If negative
#   Prepend '-' to digit_string
# End if
# Return digit_string
# END

def integer_to_string(number)
  digit_string = ''

  loop do
    number, digit = number.divmod(10)
    digit_string.prepend((digit + 48).chr)
    break if number <= 0
  end

  digit_string
end

def signed_integer_to_string(number)
  sign =  case number <=> 0
          when -1 then '-'
          when 1  then '+'
          else         ''
          end

  number = number.abs

  digit_string = integer_to_string(number)
  digit_string.prepend(sign)
  
  digit_string
end

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when  1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end


p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'