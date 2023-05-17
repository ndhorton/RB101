# Staggered Caps (Part 2)

# input: a string
# output: a new string with the value of the input except
# letters alternate uppercase-lowercase

# Given a string, string
# Set staggered_string := empty string
# Set need_uppercase := true
# Iterate over each char in string
#   if char is in the ranges 'a' to 'z' or 'A' to 'Z' && need_uppercase
#     staggered_string << char.upcase
#     need_uppercase = !need_uppercase
#   else if char is in the range 'a' ... 'Z'
#     staggered_string << char.downcase
#     need_uppercase = !need_uppercase
#   else
#     staggered_string << char
# Return staggered_string

def staggered_case(string)
  staggered_string = ''
  need_uppercase = true

  string.each_char do |char|
    if /[a-zA-Z]/.match?(char) && need_uppercase
      staggered_string << char.upcase
      need_uppercase = !need_uppercase
    elsif /[a-zA-Z]/.match?(char)
      staggered_string << char.downcase
      need_uppercase = !need_uppercase
    else
      staggered_string << char
    end
  end

  staggered_string
end

# Further explorations

def staggered_case_option(string, non_letters_count: false)
  staggered_string = ''
  need_uppercase = true

  string.each_char do |char|
    if /[a-zA-Z]/.match?(char) && need_uppercase
      staggered_string << char.upcase
      need_uppercase = !need_uppercase
    elsif /[a-zA-Z]/.match?(char)
      staggered_string << char.downcase
      need_uppercase = !need_uppercase
    else
      staggered_string << char
      need_uppercase = !need_uppercase if non_letters_count
    end
  end

  staggered_string
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case_option('I Love Launch School!')
p staggered_case_option('I Love Launch School!', non_letters_count: true)
p staggered_case_option('ALL CAPS')
p staggered_case_option('ALL CAPS', non_letters_count: true)
p staggered_case_option('ignore 77 the 444 numbers')
p staggered_case_option('ignore 77 the 444 numbers', non_letters_count: true)
