def string_to_signed_integer(str)
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
  negative = false
  integer_form = 0
  counter = 0

  counter += 1 unless ('0'..'9').include?(str[0])
  if str[0] == '-'
    negative = true
  end

  while counter < str.size
    integer_form = integer_form * 10 + digits[str[counter]]
    counter += 1
  end

  negative ? -integer_form : integer_form
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100