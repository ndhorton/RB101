# Card deck

=begin

The code below raises a `TypeError`
Once you get it to run, it will give a `sum` that is lower than it should be,
  why is this?

Notes:

The overall problem is that the rest of the code only makes sense if
the `deck` data structure had separate array values for each of the suit keys.
Instead, each value is the same array referenced by cards.
This has the consequence that when a card is removed from the array,
every suit in the deck will lose the card of that denomination.
Therefore, even were the `TypeError` removed from the code,
the remaining logic would mean that the sum of remaining cards
will be lower than it would be for a full deck of discrete cards,
since every card removed from the deck is effectively removed
four times.

On line 69, the `Enumerable#reduce` method is called on `deck`, it will iterate over the same array
value object four times. Within the block, the`map` is called with a block on
the array referenced by `cards` and, within the `reduce` block, by `remaining_cards`.
`map` iterates through the cards using a call
to the `score` method (defined over lines 33-41) to transform each card to its
integer valuation. However, the `map` method is non-destructive and nothing is
done with the new array that it returns. So when the `Array#sum` method is
called on line 62, it will attempt to add the symbol `:jack` to the sum
of the integers and this will cause a `TypeError` to be thrown, since
a Symbol cannot be added to an Integer.

In order to fix this, one could make a shallow copy of the `cards` array
using `dup` or `clone`
for each suit of the deck and then replace the call to the non-destructive
`map` method on line 70 with a call to the `map!` method, which mutates the
object it is called on. Perhaps more usefully for further
development of the card game program, the return value of `map` could be
saved to a temporary variable local to the `map` block and then that
could be summed by calling the `sum` method on line 77. The `remaining_cards`
block parameter variable could indeed be simply reassigned to the return
value of `map`.


=end

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

p cards.map { |card| score(card) }.sum

deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  remaining_cards = remaining_cards.map do |card|
    score(card)
  end

  sum + remaining_cards.sum
end


p player_cards
puts sum

# The next problem, which I didn't spot, was that the `cards` variable is
# being reassigned on line 22 within the `each` block. Since local variables
# initialized in an outer scope are available within the inner scope created by a block
# (though not vice versa) this means that the `cards` variable here is not local
# to the block. This meant that I solved the problem but when it came to checking
# that the result produced made sense, my attempt to sum the original cards
# array to calculate the deck's starting value did not work, since `cards` had
# been set to the value of the last suit iterated over by the `each` block on
# lines 21-25.
# This only became an issue because my attempts to calculate the value of the
# deck repeatedly failed (i have no idea how I managed to get 85 for the value
# of a suit, I think I must have failed to add the 10 card in addition to the
# 10 for each royal card)
# So even though I solved the problem in 23 minutes I then spent another 20
# minutes trying to work out whether the sum of remaining cards was correct
# or not.
