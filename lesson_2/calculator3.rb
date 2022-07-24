# Calculator with bonus features

def get_language
  prompt("1. English\n   2. Spanish\n   3. French")
  while true
    choice = gets.chomp
    valid_integer?(choice) ? break : prompt("Enter 1, 2 or 3")
  end
  case choice
  when '1'
    :english
  when '2'
    :spanish
  when '3'
    :french
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

# get choice of language
require 'yaml'

output_text =
  YAML.safe_load(File.read('calculator.yml'), permitted_classes: [Symbol])

WORDS = output_text[get_language]

prompt(WORDS[:greeting])

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(WORDS[:name_empty])
  else
    break
  end
end

prompt(WORDS[:name_greeting] + name + '!')

# main loop
loop do
  number1 = ''
  loop do
    prompt(WORDS[:first_num])
    number1 = gets.chomp
    if number?(number1)
      break
    else
      prompt(WORDS[:invalid_num])
    end
  end
  number2 = ''
  loop do
    prompt(WORDS[:second_num])
    number2 = gets.chomp

    if number?(number2)
      break
    else
      prompt(WORDS[:invalid_num])
    end
  end

  operator_prompt = WORDS[:op_prompt]

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(WORDS[:invalid_op])
    end
  end

  prompt("#{operation_to_message(operator)} #{WORDS[:wait_msg]}")

  result = case operator
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("#{WORDS[:result]} #{result}")

  prompt(WORDS[:again])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(WORDS[:goodbye])
