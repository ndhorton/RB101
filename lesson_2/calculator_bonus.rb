# Calculator with bonus features

# method definitions
def get_language
  prompt("1. English\n   2. Spanish\n   3. French")
  while true
    choice = gets.chomp
    valid_integer?(choice) ? break : prompt("Enter 1, 2 or 3")
  end
  case choice
  when '2'
    :spanish
  when '3'
    :french
  else
    :english
  end
end

def prompt(message)
  puts "=> #{message}"
end

def valid_integer?(num)
  num.to_i.to_s == num
end

def valid_float?(num)
  num.to_f.to_s == num
end

def number?(num)
  valid_integer?(num) || valid_float?(num)
end

def operation_to_message(op)
  case op
  when '1'
    WORDS[:op_to_msg]['1']
  when '2'
    WORDS[:op_to_msg]['2']
  when '3'
    WORDS[:op_to_msg]['3']
  when '4'
    WORDS[:op_to_msg]['4']
  end
end

def get_name
  loop do
    name = gets.chomp
    if name.empty?
      prompt(WORDS[:name_empty])
    else
      return name
    end
  end
end

def get_operator
  prompt(WORDS[:op_prompt])
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      return operator
    else
      prompt(WORDS[:invalid_op])
    end
  end
end

def get_number(ask_for)
  loop do
    prompt(ask_for)
    number = gets.chomp
    if number?(number)
      return number
    else
      prompt(WORDS[:invalid_num])
    end
  end
end

def get_result(number1, number2, operator)
  case operator
  when '1'
    number1.to_f + number2.to_f
  when '2'
    number1.to_f - number2.to_f
  when '3'
    number1.to_f * number2.to_f
  when '4'
    number1.to_f / number2.to_f
  end
end

# main program
# get choice of language
require 'yaml'
output_text = YAML.load_file('calculator.yml')
WORDS = output_text[get_language]

# ask name and greet user personally
prompt(WORDS[:greeting])
name = get_name
prompt(WORDS[:name_greeting] + name + '!')

# main loop
loop do
  # ask for numbers and operator
  number1 = get_number(WORDS[:first_num])
  number2 = get_number(WORDS[:second_num])
  operator = get_operator

  # calculate result
  prompt("#{operation_to_message(operator)} #{WORDS[:wait_msg]}")
  result = get_result(number1, number2, operator)
  prompt("#{WORDS[:result]} #{result}")

  # ask if user wants to perform another operation
  prompt(WORDS[:again])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(WORDS[:goodbye])
