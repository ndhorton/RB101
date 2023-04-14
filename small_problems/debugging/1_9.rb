# Number Guessing Game

# The most glaring problem here seems to be that within the main game loop in the
# `guess_number` method, the method calls itself again at the end
# rather than just allowing the loop to restart.
# This attempt at recursion seems totally pointless?
# There's also no `break` statement to exit the loop if you get it right.

# LS solution also points out that the winning number will be different as
# well as the attempts being reset every time the method calls itself

def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
    end
  end
end

guess_number(10, 3)

