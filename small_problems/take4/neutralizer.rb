# Neutralizer

# The problem was attempting to delete values from the collection
# you are currently iterating over. Most of time, attempting to
# conditionally delete elements from an array in an iterative manner
# should be done through a selection/filtering algorithm instead
# i.e. filter in, don't attempt to filter out

def neutralize(sentence)
  words = sentence.split(' ')
  # words.each do |word|
  #   words.delete(word) if negative?(word)
  # end

  words.reject! { |word| negative?(word) }

  words.join(' ')
end

# having said that, you can do it, it's just awkward
# and I don't think you can use `#each`
def neutralize(sentence)
  words = sentence.split
  i = 0
  while i < words.size
    if negative?(words[i])
      words.delete_at(i)
    else
      i += 1
    end
  end
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
