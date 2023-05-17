# Letter Counter (part 2)

def word_sizes(text)
  words = text.split.map { |word| word.delete('^a-zA-Z') }
  sizes = words.map(&:size)
  sizes.tally
end

# LS solution

def word_sizes(text)
  counts = Hash.new(0)
  text.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    counts[clean_word.size] += 1
  end
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
