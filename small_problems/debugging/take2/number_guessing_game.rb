# Number Guessing Game

# One problem is that there is no break statement to stop
# iterating once the user guesses correctly.
# More importantly though, every time the user guesses
# incorrectly, there is a redundant recursive call,
# despite the iterative structure being already established.
# This should work correctly if we remove the recursive call
# and add a break statement in the `if guess == winning_number`
# true branch.

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

      # Try again:
      # guess_number(max_number, max_attempts)
    end
  end
end

guess_number(10, 3)