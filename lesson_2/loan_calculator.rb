# Mortgage / Car Loan Calculator

# get string data from file to futureproof for languages other than English
require 'yaml'
word_hash = YAML.load_file('loan_calculator.yml')
WORDS = word_hash[:english]

# method definitions
def prompt(message)
  puts "=> #{message}"
end

def no_prompt(message)
  puts "   #{message}"
end

def l_align(str)
  str = str.to_s
  str.ljust(29)
end

def r_align(str)
  str = str.to_s
  str.rjust(10)
end

def valid_number?(number)
  (number.to_f > 0) &&
    (number.to_f.to_s == number || number.to_i.to_s == number)
end

def go_again?
  prompt(WORDS[:again])
  answer = nil
  loop do
    answer = gets.chomp.downcase.strip
    break if answer == 'y' || answer == 'n'
    prompt(WORDS[:yes_or_no])
  end
  answer == 'y'
end

def say_hello(name)
  prompt(format(WORDS[:name_greet], name: name))
end

def say_goodbye(name)
  prompt(format(WORDS[:goodbye], name: name))
end

def get_name
  prompt(WORDS[:name])
  loop do
    name = gets.chomp.strip
    return name unless name.empty?
    prompt(WORDS[:name_empty])
  end
end

def get_figure(message)
  loop do
    prompt(message)
    figure = gets.chomp.strip
    return figure if valid_number?(figure)
    prompt(WORDS[:valid_number])
  end
end

def get_repayments(loan_amount, apr, duration_years)
  monthly_interest = (apr / 100.0) / 12.0
  duration_months = (duration_years * 12.0).round(0)
  monthly_payment = loan_amount *
                    (monthly_interest / (1 -
                    (1 + monthly_interest)**(-duration_months)))

  { monthly_payment: monthly_payment.round(2),
    number_of_payments: duration_months,
    total_repayed: (monthly_payment * duration_months).round(2),
    total_interest: ((monthly_payment * duration_months) -
                    loan_amount).round(2) }
end

def tabulate(results)
  table = []
  results.each do |key, val|
    table << l_align(WORDS[key]) + r_align(val)
  end
  table
end

def display_repayments(table)
  table.each_with_index do |elem, idx|
    idx == 0 ? prompt(elem) : no_prompt(elem)
  end
end

# main program
system('clear')
name = get_name

# main loop
loop do
  system('clear')
  say_hello(name)

  loan_amount = get_figure(WORDS[:amount_prompt]).to_f
  apr = get_figure(WORDS[:apr_prompt]).to_f
  duration_years = get_figure(WORDS[:duration_prompt]).to_f

  repayments = get_repayments(loan_amount, apr, duration_years)

  repayment_table = tabulate(repayments)
  display_repayments(repayment_table)

  break unless go_again?
end

say_goodbye(name)
