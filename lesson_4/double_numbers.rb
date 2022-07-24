def double_numbers(numbers)
  doubled_numbers = []
  counter = 0
  loop do
    break if counter >= numbers.size
    
    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

def double_numbers!(numbers)
  counter = 0
  loop do
    break if counter >= numbers.size

    numbers[counter] *= 2

    counter += 1
  end
  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p my_numbers
p double_numbers(my_numbers)
p my_numbers

reckless_numbers = [5, 9, 2, 3]
p reckless_numbers
p double_numbers!(reckless_numbers)
p reckless_numbers