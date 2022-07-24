def string_to_integer(str)
  digits = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9
  }
  integer_form = 0
  counter = 0
  while counter < str.size
    integer_form = integer_form * 10 + digits[str[counter]]
    counter += 1
  end
  integer_form
end

# def string_to_signed_integer(str)
#   if ('0'..'9').include?(str[0])
#     string = str
#     sign = :+
#   else
#     string = str[1..-1]
#     sign = str[0].to_sym
#   end
#   [0, string_to_integer(string)].inject(&sign)
# end

def string_to_signed_integer(str)
  sign = (str[0] == '-') ? -1 : 1
  start = (('0'..'9').include?(str[0])) ? 0 : 1
  sign * string_to_integer(str[start..-1])
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
p string_to_signed_integer('-3757')