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

def signed_integer_to_string(number)
  sign = ''
  case number <=> 0
  when -1
    sign = '-'
    number *= -1
  when 1
    sign = '+' 
  end
  sign + integer_to_string(number)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'