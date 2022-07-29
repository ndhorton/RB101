def builder(hand)
  card_strings = ["The #{hand[0][1]} of #{hand[0][0]}"]
  
  i = 1
  while i < hand.size
    card_strings << "the #{hand[i][1]} of #{hand[i][0]}"
    i += 1
  end

  card_strings
end

p builder([['Hearts', 'Queen'], ['Clubs', '2']])