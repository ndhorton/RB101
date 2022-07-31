def letter_case_count(str)
  case_count = {
    uppercase: 0,
    lowercase: 0,
    neither: 0
  }

  str.each_char do |char|
    if ('A'..'Z').include?(char)
      case_count[:uppercase] += 1
    elsif ('a'..'z').include?(char)
      case_count[:lowercase] += 1
    else
      case_count[:neither] += 1
    end
  end

    case_count
end

# LS solution
def letter_case_count(str)
  counts = {}
  characters = str.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# input: a string
# output: a hash with three entries. :lowercase => no. of lowercase letters in string,
# :uppercase => no. of uppercase, :neither => no. of other chars

# algo:

# -given a string
# -create empty hash with default value of 0
# -iterate through each char in string
# --if char is included in the set of uppercase letters
# ---increment :uppercase in hash
# --else if char is included in set of lowercase letters
# ---increment :lowercase in hash
# --else
# ---increment :neither in hash
# -return hash
