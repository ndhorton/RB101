# Number Guessing Game

=begin
1) The loop in `guess_number` continues even if you guess correctly.
2) If you guess incorrectly the method calls itself recursively even
though the iterative structure is already in place. This will create
a pseudoinfinite loop, where the random number is different
every time you guess incorrectly and `attempts` is constantly reset
also.

The way to fix it
1) break from iteration when you guess correctly
2) simply don't make the recursive call as the finite iteration
   is already taken care of by the loop and the `attempts` counter
   and `break` condition.

=end

def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1# Try again:
    guess_number(max_number, max_attempts)
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

# 11:11
