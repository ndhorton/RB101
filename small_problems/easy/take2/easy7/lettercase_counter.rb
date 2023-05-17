# Lettercase Counter

# input: a string
# output: a hash with 3 keys, :lowercase, :uppercase, :neither
# associated to the corresponding character-type counts

# Given a string
# Set counts := empty hash
# Set counts[:lowercase] := the count of lowercase letters
# Set counts[:uppercase] := the count of uppercase letters
# Set counts[:neither] := the count of not uppercase or lowercase letters
# Return counts 

def letter_case_count(string)
  counts = {}
  counts[:lowercase] = string.count('a-z')
  counts[:uppercase] = string.count('A-Z')
  counts[:neither] = string.count('^a-zA-Z')
  counts
end

# LS solution

UPPERCASE_CHARS = ('A'..'Z').to_a
LOWERCASE_CHARS = ('a'..'z').to_a

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |char|
    if UPPERCASE_CHARS.include?(char)
      counts[:uppercase] += 1
    elsif LOWERCASE_CHARS.include?(char)
      counts[:lowercase] += 1
    else
      counts[:neither] += 1
    end
  end

  counts
end

def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^a-zA-Z]/ }
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
