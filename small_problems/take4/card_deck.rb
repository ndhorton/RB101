# Card Deck

=begin

The deck only has 13 cards, since every suit key in the `cards` deck points
to the same array of 13 cards. Use `#dup`

Redundant reassignment in `#reduce` method
non-destructive `map` return value not captured

=end

CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace].freeze

deck = { :hearts   => CARDS.dup,
         :diamonds => CARDS.dup,
         :clubs    => CARDS.dup,
         :spades   => CARDS.dup }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  scores = remaining_cards.map do |card|
    score(card)
  end

  sum + scores.sum
end

puts sum

# 13:11
