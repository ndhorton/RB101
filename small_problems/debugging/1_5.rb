# Card deck

require 'pry'

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen,:king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

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

# sum = deck.reduce(0) do |sum, (_, remaining_cards)|
#   remaining_cards.map! do |card|
#     score(card)
#   end

# LS solution to this part avoids mutating the pack
sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  scores = remaining_cards.map do |card|
    score(card)
  end

  sum += scores.sum
end

# puts sum

# LS test case checks that the sum of the remaining cards
# plus the sum of player's cards is equal to the sum of a
# whole deck

total_sum = 4 * [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11].sum
player_sum = player_cards.map { |card| score(card) }.sum

puts (sum == total_sum - player_sum) 
