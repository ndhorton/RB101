#  Mortgage / Car Loan Calculator

def display_results(results)
  puts "monthly payment: #{results[:monthly_payment]}"
  puts "number of payments: #{results[:duration_months]}"
  puts "total to be repayed: #{results[:total_repayed]}"
  puts "total interest: #{results[:total_interest]}"
  puts
end

def calculate_repayments(loan_amount, apr, duration_years)
  loan_amount = loan_amount.to_f
  monthly_interest = (apr / 100.0) / 12.0
  duration_months = duration_years * 12.0

  monthly_payment = loan_amount *
                    (monthly_interest / (1 -
                    (1 + monthly_interest)**(-duration_months)))

  { monthly_payment: monthly_payment,
    duration_months: duration_months,
    total_repayed: monthly_payment * duration_months,
    total_interest:(monthly_payment * duration_months) - loan_amount }
end

test_a = calculate_repayments(100_000, 5, 25)
test_b = calculate_repayments(1, 0.01, 1)
test_c = calculate_repayments(10_000_000, 9.5, 17.5)

display_results(test_a)
display_results(test_b)
display_results(test_c)
