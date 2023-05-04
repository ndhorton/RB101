# Arithmetic Integer

# Implicit requirement: integer division not float division

def prompt(message)
  puts("==> #{message}")
end

# prompt("Enter the first number: ")
# first_number = gets.chomp.to_i

# prompt("Enter the second number: ")
# second_number = gets.chomp.to_i

# prompt("#{first_number} + #{second_number} = #{first_number + second_number}")
# prompt("#{first_number} - #{second_number} = #{first_number - second_number}")
# prompt("#{first_number} * #{second_number} = #{first_number * second_number}")
# prompt("#{first_number} / #{second_number} = #{first_number / second_number}")
# prompt("#{first_number} % #{second_number} = #{first_number % second_number}")
# prompt("#{first_number} ** #{second_number} = #{first_number ** second_number}")

prompt("Enter the first number: ")
first_number = gets.chomp.to_f

prompt("Enter the second number: ")
second_number = gets.chomp.to_f

prompt("#{first_number} + #{second_number} = #{first_number + second_number}")
prompt("#{first_number} - #{second_number} = #{first_number - second_number}")
prompt("#{first_number} * #{second_number} = #{first_number * second_number}")
prompt("#{first_number} / #{second_number} = #{first_number / second_number}")
prompt("#{first_number} % #{second_number} = #{first_number % second_number}")
prompt("#{first_number} ** #{second_number} = #{first_number ** second_number}")

# division is now float division
# modulo operator becomes a strange operation when using floats (though floating-point
# imprecision aside it does work even with decimal fractions, which is surprising)
# Also, if the second number is 0, you will now get Infinity/-Infinity/NaN instead
# of a ZeroDivisionError