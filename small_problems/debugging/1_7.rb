# Neutralizer

# negative?() returns `true` if a word is included in a list of
# forbidden negative words, `false` otherwise
#
# neutralize(sentence) attempts to remove any negative words from
# a sentence but does so by destructively removing elements from
# the array it is iterating over. This causes it to skip over
# some words because the indexes it is using no longer match
# the data structure
# could replaced by delete_if method or reject!

def neutralize(sentence)
  words = sentence.split(' ')
  words.delete_if { |word| negative?(word) }
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

def mutating_reject(array)
  i = 0
  loop do
    break if i == array.length

    if yield(array[i]) # if array[i] meets the condition checked by the block (if block returns truthy value)
      array.delete_at(i)
    else
      i += 1 # only increments index counter if there is no deletion so it doesn't skip elements
    end
  end

  array
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
