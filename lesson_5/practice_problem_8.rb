hsh = {
  first: ['the', 'quick'],
  second: ['brown', 'fox'],
  third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog']
}
vowels = ''
hsh.each_value do |arr|
  arr.each do |str|
    str.each_char do |char|
      if 'aeiou'.include?(char)
        vowels << char
      end
    end
  end
end
p vowels
