# Letter counter (part 1)

# input: a string with one or more space-separated words
# output: a hash whose keys are the unique sizes of words in the
# input string and whose values are the number of words of that size

# Give a string, text
# Set words := split(text, ' ')
# Set sizes := transform words such that each element is word.length
# sizes = unique(sizes)
# Set tally := empty hash
# For each size in sizes
#   tally[size] = count(sizes, size)
# Return tally

def word_sizes(text)
  text.split.map(&:size).tally
end

def word_sizes(text)
  sizes = text.split.map(&:size)
  tally = {}
  sizes.uniq.each do |word_size|
    tally[word_size] = sizes.count(word_size)
  end
  tally
end

# LS solution

def word_sizes(text)
  counts = Hash.new(0)
  text.split.each do |word|
    counts[word.size] += 1
  end
  counts
end

def word_sizes(text)
  counts = {}
  text.split.each do |word|
    if counts.keys.include?(word.size)
      counts[word.size] += 1
    else
      counts[word.size] = 1
    end
  end
  counts
end

def word_sizes(text)
  counts = Hash.new { |hash, new_key| hash[new_key] = 0 } # default proc for
                                                          # when a non-existent key
  text.split.each do |word|                               # is accessed
    counts[word.size] += 1
  end

  counts
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
