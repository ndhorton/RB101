# Rock paper scissors (lizard Spock) with bonus features

# constant definitions
VALID_CHOICES = %w(rock paper scissors lizard spock)

VALID_SHORTHAND = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

X_BEATS_Y = {
  case_1: {
    rock: 'scissors',
    paper: 'rock',
    scissors: 'paper',
    lizard: 'spock',
    spock: 'rock'
  },
  case_2: {
    rock: 'lizard',
    paper: 'spock',
    scissors: 'lizard',
    lizard: 'paper',
    spock: 'scissors'
  }
}

# method definitions

def prompt(message)
  puts "=> #{message}"
end

def win?(player1, player2)
  X_BEATS_Y[:case_1][player1.to_sym] == player2 ||
    X_BEATS_Y[:case_2][player1.to_sym] == player2
end

def get_winner(player, computer)
  if win?(player, computer)
    winner = 'player'
  elsif win?(computer, player)
    winner = 'computer'
  else
    winner = 'tie'
  end
  winner
end

def get_choice(match)
  prompt("Match #{match}:")
  while true
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase.strip
    VALID_SHORTHAND.each do |shorthand, full|
      if choice == shorthand
        choice = full
      end
    end
    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end
  choice
end

def play_again?
  prompt('Do you want to play again?')
  answer = gets.chomp.downcase.strip
  answer.start_with?('y')
end

def display_welcome
  prompt('Welcome to Rock, Paper, Scissors, Lizard, Spock!')
  prompt('First to win 3 matches wins the round')
  puts
end

def display_match_results(player_choice, computer_choice, winner)
  system('clear')
  prompt("You chose #{player_choice}; Computer chose: #{computer_choice}")
  if winner == 'player'
    prompt("You won!")
  elsif winner == 'computer'
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
  puts
end

def display_round_results(player_score, computer_score)
  prompt("At the end of that round you scored #{player_score}, "\
    "Computer scored #{computer_score}")
  if player_score > computer_score
    prompt("Congratulations! You won!")
  else
    prompt("Better luck next time...")
  end
end

def play_round
  display_welcome
  player_score = 0
  computer_score = 0
  match = 1
  until player_score == 3 || computer_score == 3
    player_choice = get_choice(match)
    computer_choice = VALID_CHOICES.sample
    winner = get_winner(player_choice, computer_choice)
    player_score += 1 if winner == 'player'
    computer_score += 1 if winner == 'computer'
    display_match_results(player_choice, computer_choice, winner)
    match += 1
  end
  display_round_results(player_score, computer_score)
end

# main program loop
loop do
  system('clear')
  play_round
  break unless play_again?
end
prompt('Goodbye!')
