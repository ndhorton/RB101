# Arithmetic integer

OPERATORS = [:+,:-,:*,:/,:%,:**]

def get_number(nonzero=false)
  while true
    number = gets.chomp.strip
    if nonzero
      break if (number.to_i.to_s == number ||
        number.to_f.to_s == number) &&
        number.to_f != 0
      puts "==> Please enter a non-zero number."
    else
      break if (number.to_i.to_s == number ||
        number.to_f.to_s == number)
      puts "==> Please enter a valid number."
    end
  end    
  number.to_r
end  

numbers = []

puts "==> Enter the first number:"
numbers << get_number

puts "==> Enter the second number:"
numbers << get_number(nonzero=true)

OPERATORS.each do |operator|
  result = numbers.inject(&operator).to_f
  puts "==> #{numbers[0].to_f} #{operator} #{numbers[1].to_f} = #{result}"
end
