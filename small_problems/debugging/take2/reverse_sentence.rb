# Reverse Sentence

=begin

purpose:
  The reverse_sentence method should return a new string with the words of
  its argument in reverse order, without using any of Ruby's built-in
  `reverse` methods.


notes:

so it is the order of the words, not the words themselves, that needs
to be reversed.

On line 14, the `reverse_sentence` method is called with the string literal
`"how are you doing"` passed as argument.
The `reverse_sentence` method is defined on lines 1-12 with one parameter,
`sentence`. On this invocation, `sentence` is assigned the String object
whose value is `"how are you doing"`.
Within the body of the definition, on line 2, local variable `words` is
initialized to the return value of calling `String#split` on `sentence`
with a space passed as the separator argument. This will split the
`sentence` string on space characters into a new Array of new String objects,
each of which will have the value of a word substring of the calling String.
On the next line, local variable `reversed_words` is initialized to an
empty array. After that, variable `i` is initialized to `0`.
On line 6, a `while` loop begins, which will continue as long as the integer
currently referenced by `i` is less than the return value of calling
`length` on the `words` array.

On line 7, `reversed_words` is reassigned to the return value of 
`words[i] + reversed_words`. The problem lies here. `words[i]` uses
indexed element reference to return an element from `words`, which
will be a String object. Therefore, the `+` method called will be
`String#+`, which cannot accept the Array object referenced by
`reversed_words` as an argument. [TypeError?]

A simple way to fix this might be to wrap `words[i]` in an Array
constructor, for instance the literal constructor `[words[i]]`. 
An alternative might be to use the `Array#unshift` method:
```ruby
reversed_words.unshift(words[i])
```

Thereafter, the method's final line `reversed_words.join(' ')` should
implicitly return the correct value.

=end

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = [words[i]] + reversed_words
    # reversed_words.unshift(words[i])
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'
