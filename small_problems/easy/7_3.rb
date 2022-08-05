# input: a string
# output: that same string with each word capitalized and the rest lowercase

# if a word starts with a non-alphabetic char, do not capitalize the word after the
#   non-alphabetic char

# algorithm:

# -given a string
# -separate out the words and save to an array
# -iterate over the array
# -capitalize each word
# -join back to a string around spaces
# -return new string

# capitalise method:
# -given a string
# -return string is the string is empty
# -set capital_str = ''
# -if first letter is included in the set of lower case letters
# --set asci_val = ascii value of first letter
# --asci_val = asci_val - 32
# --append the char value of asci_val to capital_str
# -else
# --append first letter to capital_str
# -iterate over the chars in string from index 1 onwards (if 1 exists)
# --if char is included in the set of uppercase letters
# ---set asci_val = ascii value of char + 32
# ---append char value of asci_val to capital_str
# --else
# ---append char to capital_str
# -return capital_str


# Further explorations
# def capitalise(string)
#   return string if string.empty?
#   char_arr = string.chars
#   char_arr[0].upcase!

#   i = 1
#   loop do
#     break if i >= string.length
#     char_arr[i].downcase!
#     i += 1
#   end

#   char_arr.join
# end

def capitalise(string)
  return string if string.empty?

  capital_str = ''

  if ('a'..'z').include?(string[0])
    capital_str << (string[0].ord - 32).chr
  else
    capital_str << string[0]
  end

  i = 1
  loop do
    break if i >= string.size
    
    if ('A'..'Z').include?(string[i])
      capital_str << (string[i].ord + 32).chr
    else
      capital_str << string[i]
    end

    i += 1
  end

  capital_str
end

def word_cap(string)
  string.split.map { |elem| capitalise(elem) }.join(' ')
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'