def integer_to_string(num)
  digits = Array('0'..'9')

  num_string = ''
  loop do
    current_digit = num % 10
    num /= 10
    num_string.prepend(digits[current_digit])
    break if num <= 0
  end

  num_string
end

# def signed_integer_to_string(num)
#   if num > 0
#     '+' + integer_to_string(num)
#   elsif num < 0
#     '-' + integer_to_string(num * -1)
#   else
#     '0'
#   end
# end

# LS solution

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when 1 then "+#{integer_to_string(number)}"
  else        integer_to_string(number)
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'