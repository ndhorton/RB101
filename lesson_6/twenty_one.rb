CASINO_SHUFFLE = 7

CARD_VALUES = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
  '9' => 9, '10' => 10, 'Jack' => 10, 'Queen' => 10, 'King' => 10
}

def prompt(message)
  puts "=> #{message}"
end

def joiner(hand)
  case hand.size
  when 0 then ''
  when 1 then hand.first
  when 2 then hand.join(" and ")
  else
    hand.slice(0, hand.size - 1).join(", ") + ", and #{hand[-1]}"
  end
end

def initialize_deck
  deck =
    [*('2'..'10'), *('2'..'10'), *('2'..'10'), *('2'..'10')] +
    ['Ace', 'Ace', 'Ace', 'Ace'] +
    ['Jack', 'Jack', 'Jack', 'Jack'] +
    ['Queen', 'Queen', 'Queen', 'Queen'] +
    ['King', 'King', 'King', 'King']

  shuffle_deck!(deck)

  deck
end

def deal_hand(deck)
  hand = [deck[-1], deck[-2]]
  [hand, deck.slice(0, deck.size - 2)]
end

def shuffle_deck!(deck)
  CASINO_SHUFFLE.times { deck.shuffle! }
end

def initialize_ace_values(hand)
  hand.select { |card| card == 'Ace' }.map { |_| 11 }
end

def get_base_value(hand)
  hand.reject { |card| card == 'Ace' }.map { |card| CARD_VALUES[card] }.sum
end

def get_score(hand)
  ace_values = initialize_ace_values(hand)
  base_value = get_base_value(hand)

  i = 0
  while (base_value + ace_values.sum > 21) && (i < ace_values.size)
    ace_values[i] = 1
    i += 1
  end

  base_value + ace_values.sum
end

def display_player_hand(hand)
  prompt "You have: #{joiner(hand)}"
end

def display_dealer_hand(hand)
  prompt "Dealer has: #{hand.first} and unknown card"
end

def display_hands(player_hand, dealer_hand)
  system('clear')
  display_dealer_hand(dealer_hand)
  display_player_hand(player_hand)
  puts
end

def hit_or_stay
  prompt "Hit or stay?"

  choice = ''
  valid_choices = ['hit', 'h', 'stay', 's']
  loop do
    choice = gets.chomp.downcase
    break if valid_choices.include?(choice)
    prompt "That is not a valid choice."
  end

  choice[0]
end

def deal_card(hand, deck)
  hand += [deck[-1]]
  [hand, deck.slice(0, deck.size - 1)]
end

def bust?(hand)
  !!(get_score(hand) > 21)
end

def twenty_one?(hand)
  !!(get_score(hand) == 21)
end

def dealer_plays(dealer_hand, deck)
  loop do
    if get_score(dealer_hand) < 17
      dealer_hand, deck = deal_card(dealer_hand, deck)
    else
      break
    end
  end

  [dealer_hand, deck]
end

def display_score(player_score, dealer_score)
  prompt "Dealer has: #{dealer_score}"
  prompt "You have: #{player_score}"
  puts
end

def busted(player_hand, dealer_hand)
  dealer_score = get_score(dealer_hand)
  player_score = get_score(player_hand)
  system('clear')
  display_final_hands(player_hand, dealer_hand)
  display_score(player_score, dealer_score)

  if bust?(player_hand)
    prompt "You're bust!"
    prompt "The house wins!"
  elsif bust?(dealer_hand)
    prompt "The house is bust!"
    prompt "You win!"
  end
end

def display_final_hands(player_hand, dealer_hand)
  prompt "Dealer has: #{joiner(dealer_hand)}"
  display_player_hand(player_hand)
  puts
end

def declare_winner(player_hand, dealer_hand)
  dealer_score = get_score(dealer_hand)
  player_score = get_score(player_hand)
  system('clear')
  display_final_hands(player_hand, dealer_hand)
  display_score(player_score, dealer_score)

  if player_score > dealer_score
    prompt "You win!"
  elsif dealer_score > player_score
    prompt "The house wins!"
  else
    prompt "It's a tie!"
  end
end

def play_again?
  puts
  prompt "Play again (y or n)?"
  again = gets.chomp.downcase
  !!again.start_with?('y')
end

def say_goodbye
  system('clear')
  puts "*** Thanks for playing Twenty-One! Goodbye! ***"
  puts
end

# Main game loop
system('clear')
puts "*** Welcome to Twenty-One! ***"
system('sleep 1.75')
loop do
  # Deal starting hands
  deck = initialize_deck
  dealer_hand, deck = deal_hand(deck)
  player_hand, deck = deal_hand(deck)

  # Player turn loop
  loop do
    display_hands(player_hand, dealer_hand)

    if hit_or_stay == 'h'
      player_hand, deck = deal_card(player_hand, deck)
    else
      break
    end

    break if bust?(player_hand) || twenty_one?(player_hand)
  end

  # Dealer turn unless the player already bust
  dealer_hand, deck = dealer_plays(dealer_hand, deck) unless bust?(player_hand)

  # Determine who won
  if bust?(player_hand) || bust?(dealer_hand)
    busted(player_hand, dealer_hand)
  else
    declare_winner(player_hand, dealer_hand)
  end

  break unless play_again?
end

say_goodbye
