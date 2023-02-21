VALID_CHOICES = %w(rock paper scissors lizard spock)
SHORTCUTS = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}
WINNING_MOVES = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['rock', 'scissors']
}

def match_winner?(player_wins, computer_wins)
  player_wins >= 3 || computer_wins >= 3
end

def valid_shortcut?(choice)
  SHORTCUTS.key?(choice)
end

def test_method
  prompt('test message')
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

# I tried using a case statement and helper methods
# to see how it could be done without nested data structures

# def rock_beats?(move)
#   move == 'scissors' || move == 'lizard'
# end

# def paper_beats?(move)
#   move == 'rock' || move == 'spock'
# end

# def scissors_beats?(move)
#   move == 'paper' || move == 'lizard'
# end

# def lizard_beats?(move)
#   move == 'spock' || move == 'paper'
# end

# def spock_beats?(move)
#   move == 'rock' || move == 'scissors'
# end

def win?(first, second)
  WINNING_MOVES[first].include?(second)
  # case first
  # when 'rock'
  #   rock_beats?(second)
  # when 'paper'
  #   paper_beats?(second)
  # when 'scissors'
  #   scissors_beats?(second)
  # when 'lizard'
  #   lizard_beats?(second)
  # when 'spock'
  #   spock_beats?(second)
  # end
end

def display_results(player, computer)
  Kernel.puts("You chose #{player}; Computer chose: #{computer}")

  if win?(player, computer)
    prompt("You won")
  elsif win?(computer, player)
    prompt("Computer won")
  else
    prompt("It's a tie!")
  end
end

def display_match_results(player_wins, computer_wins)
  puts
  if player_wins > computer_wins
    prompt("At the end of that match, " \
      "you won by #{player_wins} games to #{computer_wins}")
  else
    prompt("At the end of that match, " \
      "computer won by #{computer_wins} games to #{player_wins}")
  end
end

system('clear')

player_wins = 0
computer_wins = 0

loop do
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if valid_shortcut?(choice)
      choice = SHORTCUTS[choice]
    end

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_wins += 1
  elsif win?(computer_choice, choice)
    computer_wins += 1
  end

  break if match_winner?(player_wins, computer_wins)
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

if match_winner?(player_wins, computer_wins)
  display_match_results(player_wins, computer_wins)
end
