def output(message)
  puts "=> #{message}"
end

def ask(message)
  print("=> #{message} ")
end

def valid_number?(number)
  ((number.to_f.to_s == number) || (number.to_i.to_s == number)) &&
    (number.to_f > 0)
end

def valid_percentage?(number)
  (valid_number?(number)) && (number.to_f <= 100)
end

def get_bill
  ask('What is the bill?')
  loop do
    bill = gets.chomp.strip
    return bill.to_f if valid_number?(bill)
    ask('Please enter a valid number:') 
  end
end

def get_tip_percentage
  ask('What is the tip percentage?')
  loop do
    tip_percentage = gets.chomp.strip
    return tip_percentage.to_f if valid_percentage?(tip_percentage)
    ask('Please enter a valid percentage:')
  end
end

def display_tip(bill, tip_percentage)
  tip = ((bill / 100) * tip_percentage).ceil(2)
  total = (bill + tip).ceil(2)
  output("The tip is $#{format("%.2f", tip)}")
  output("The total is $#{format("%.2f", total)}")
end

system('clear')
bill = get_bill
tip_percentage = get_tip_percentage
display_tip(bill, tip_percentage)