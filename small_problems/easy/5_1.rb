def ascii_value(str)
  str.chars.sum { |char| char.ord }
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further exploration:
# char.ord.chr == char