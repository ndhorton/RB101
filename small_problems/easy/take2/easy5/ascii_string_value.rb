# ASCII String Value

def ascii_value(string)
  string.bytes.sum
end

def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further exploration

char = 'a'

p char.ord.chr == char
