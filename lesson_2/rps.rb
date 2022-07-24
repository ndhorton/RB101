VALID_CHOICES = ['rock', 'paper', 'scissors']

def display_results(player, computer)
  win = { rock: 'scissors',
          paper: 'rock',
          scissors: 'paper' }

  lose = { rock: 'paper',
           paper: 'scissors',
           scissors: 'rock' }

  if win[player.to_sym] == computer
    prompt("You won!")
  elsif lose[player.to_sym] == computer
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  puts "=> #{message}"
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt('Do you want to play again?')
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end
