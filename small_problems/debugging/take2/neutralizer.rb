# Neutralizer

=begin

The `neuralize` method fails to remove all negative words from
sentences. What exactly happens?

Line numbers refer to the original code snippet.

On line 18, the first line of the main program, the `puts` method
is called with the return value of a call to `neutralize` passed as
argument. `neutralize` is called with a string in literal notation
passed as argument: `'These dull boring cards are part of a chaotic board game.'`

The `neutralize` method is defined on lines 1-8. On this invocation,
the method parameter `sentence` is assigned to the String object instantiated
by the literal notation.

Within the body of the method, local variable `words` is initialized
to the return value of calling `split(' ')` on `sentence`. This method non-destructively
splits the string into substrings using the space as a separator character and
returns them in a new Array object; this is assigned to `words`.

Next, the `each` method is invoked on `words` with a `do...end` block. `each`
will iterate through each element passing each in turn to the block 
to be assigned to block parameter `word`. Within the block, the `delete` method is
called on `words` if an `if` modifier condition is satisfied.

This call to `delete` is the problem. Since `delete` is a destructive method that
removes elements from the object it is calle on, and since we are currently
iterating over that array object, this mutation of the collection we are
iterating over causes the unexpected behaviour.

The indexing of the `each` method is thrown off by the removal of elements
during iteration and so some elements will simply be passed over.

In order to remedy this, we could completely redesign the `neutralize` method
to incorporate the array of negative words currently stored in the helper
method `negative?` (used by the `if` modifier check); we could iterate over
this array of negative words, calling `delete` on the `words` array for each
element in the array of negative words without a problem, since we would
not be modifying the array we are iterating over.

Alternatively, we could copy each word from the `words` array to an initially
empty `clean_words` array with the modifier changed to `unless negative?(word)`.
Then we could call `join` on `clean_words` and return the result.

LS solution simply uses the destructive `reject!` method to do this in-place
on the `words` array.
=end


def neutralize(sentence)
  words = sentence.split
  clean_words = []
  words.each do |word|
    clean_words << word unless negative?(word)
  end

  clean_words.join(' ')
end

# LS solution
def neutralize(sentence)
  words = sentence.split(' ')
  mutating_reject(words) { |word| negative?(word) }
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

# Further exploration
def mutating_reject(array)
  index = 0
  loop do
    break if index >= array.size
    element = array[index]
    if yield(element)
      array.delete(element)
    else
      index += 1
    end
  end
  array
end

# LS solution
def mutating_reject(array)
  i = 0
  loop do
    break if i == array.size

    if yield(array[i]) # if the block returns a truthy value, i.e
                       # if array[i] meets the condition checked by the block
      array.delete_at(i)
    else
      i += 1
    end
  end

  array
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
