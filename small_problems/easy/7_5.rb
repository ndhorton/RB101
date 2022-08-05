def staggered_case(string, upcase_turn=true)
  staggered_str = ''

  string.each_char do |char|
    if upcase_turn
      staggered_str << char.upcase
    else
      staggered_str << char.downcase
    end

    upcase_turn = !upcase_turn
  end

  staggered_str
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case('spongebob text', false)

# input: a string
# output: new string which is the result of capitalizing every other letter in the
# input string and lowercasing the others

# non-alpha chars are reproduced as they were in the input string but count towards
# the alternation pattern, so Uppercase | non-alpha | Uppercase

# algo:
# -given a string
# -set uppercase = true
# -set staggered_str = ''
# -iterate through the chars in the string
# --if uppercase
# ---append uppercased char to staggered_str
# --else
# ---append lowercased char to staggered_str
# --uppercase = ^uppercase
# -return staggered_str