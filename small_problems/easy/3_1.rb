# Searching 101

def get_first_five_numbers
  ask_for = ['1st', '2nd', '3rd', '4th', '5th']
  first_five_numbers = []
  ask_for.each do |ordinal|
    puts "==> Enter the #{ordinal} number:"
    while true
      current_number = gets.chomp.strip
      break if current_number.to_i.to_s == current_number
      puts '==> Please enter a valid integer.'
    end
    first_five_numbers << current_number.to_i
  end
  first_five_numbers
end

def get_last_number
  puts '==> Enter the last number:'
  while true
    last_number = gets.chomp.strip
    break if last_number.to_i.to_s == last_number
    puts "==> Please enter a valid integer."
  end
  last_number.to_i
end

first_five_numbers = get_first_five_numbers
last_number = get_last_number

if first_five_numbers.include?(last_number)
  puts "The number #{last_number} appears in #{first_five_numbers}."
else
  puts "The number #{last_number} does not appear in #{first_five_numbers}."
end
