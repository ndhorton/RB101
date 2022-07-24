def is_an_ip_number?(word)
  word.to_i.to_s == word && (0..255).include?(word.to_i)
end

# mine
# def dot_separated_ip_address?(input_string)
#   input_string.count('.') == 3 &&
#     !input_string.split(".").map { |n| is_an_ip_number?(n) }.include?(false)
# end

# LS solution
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

p dot_separated_ip_address?('123.1.34.244')
p dot_separated_ip_address?('dave')
p dot_separated_ip_address?('156.255.1.0.89')
p dot_separated_ip_address?('176.1')
p dot_separated_ip_address?('-1.455.1.2')
p dot_separated_ip_address?('0.255.255.0')