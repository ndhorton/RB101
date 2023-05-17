# Capitalize Words

def word_cap(string)
  string.scan(/\s+|\S+/).map(&:capitalize).join
end

def word_cap(string)
  capitalized_string = ''

  string.each_char do |char|
    if capitalized_string[-1] == ' '
      capitalized_string << char.upcase
    elsif !capitalized_string[-1]
      capitalized_string << char.upcase
    else
      capitalized_string << char.downcase
    end
  end
  
  capitalized_string
end

# LS solutions
def word_cap(words)
  words_array = words.split.map do |word|
    word.capitalize
  end
  words_array.join(' ')
end

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
  # Supposedly the `&:method_name` syntax works only
  # for methods which take a block but have no required
  # arguments
end

# Further explorations

def word_cap(string)
  words = string.split
  capitalized_words = words.map do |word|
    word[0].upcase << word[1..].downcase
  end
  capitalized_words.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
