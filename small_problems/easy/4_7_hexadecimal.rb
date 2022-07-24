# def hexadecimal_to_integer(string)
#   numbers = {
#     '0' => 0,
#     '1' => 1,
#     '2' => 2,
#     '3' => 3,
#     '4' => 4,
#     '5' => 5,
#     '6' => 6,
#     '7' => 7,
#     '8' => 8,
#     '9' => 9,
#     'A' => 10,
#     'B' => 11,
#     'C' => 12,
#     'D' => 13,
#     'E' => 14,
#     'F' => 15
#   }
#   integer_version = 0

#   string.reverse.each_char.with_index do |char, idx|
#     if ('A'..'z').include?(char)
#       integer_version += numbers[char.upcase] * (16 ** idx)
#     else
#       integer_version += numbers[char] * (16 ** idx)
#     end
#   end

#   integer_version
# end

# p hexadecimal_to_integer('4D9f') == 19871

def hexadecimal_to_integer(string)
  numbers = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    'A' => 10,
    'B' => 11,
    'C' => 12,
    'D' => 13,
    'E' => 14,
    'F' => 15
  }

  digits = string.chars.map do |char|
    if [*'A'..'Z', *'a'..'z'].include?(char)
      numbers[char.upcase]
    else
      numbers[char]
    end
  end

  integer_version = 0
  digits.each do |digit|
    integer_version = 16 * integer_version + digit
  end
  
  integer_version
end

p hexadecimal_to_integer('4D9f') == 19871

