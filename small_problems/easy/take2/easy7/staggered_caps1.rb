# Staggered Caps (Part 1)

# input: a string
# output: a new string that contains the original value but with every other character
# converted to a capital letter (non-letter chars are unchanged but count in the scheme
# of alternation) !!! fuzziness here: the others should be converted to lowercase

# Given a string, string
# Set staggered = empty string
# Iterate over each char in string with index
#   if index is even
#     staggered << char.upcase
#   else
#     staggered << char.downcase
#   end
# end
# Return staggered

def staggered_case(string)
  characters = string.chars.map.with_index do |char, index|
    index.even? ? char.upcase : char.downcase
  end

  characters.join
end

# LS solution

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

# further exploration

def staggered_case2(string, start_upper: true)
  result = ''
  need_upper = start_upper
  string.chars.each do |char|
    if need_upper
      result << char.upcase
    else
      result << char.downcase
    end
    need_upper = !need_upper
  end
  result
end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case2('I Love Launch School!')
p staggered_case2('I Love Launch School!', start_upper: false)
p staggered_case2('ALL_CAPS')
p staggered_case2('ALL_CAPS', start_upper: false)
p staggered_case2('ignore 77 the 444 numbers')
p staggered_case2('ignore 77 the 444 numbers', start_upper: false)

