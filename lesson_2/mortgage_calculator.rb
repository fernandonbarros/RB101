## Mortgage Calculator
def prompt(message)
  puts ">> #{message}"
end

def float?(val)
  val.to_f.to_s == val
end

def int?(val)
  val.to_i.to_s == val
end

def number?(val)
  int?(val) || float?(val)
end

## Get inputs
# loan amount, APR, loan duration
loan_amount = nil
apr = nil
duration = nil
loop do
  prompt 'Enter loan amount in dollars:'
  loan_amount = gets.chomp

  break if number?(loan_amount)

  prompt 'Invalid loan amount, try again.'
end

loop do
  prompt 'Enter APR in %'
  apr = gets.chomp.delete(' %')

  break if number?(apr)

  prompt 'Invalid APR amount, try again.'
end

loop do
  prompt 'Enter loan duration in years:'
  duration = gets.chomp

  break if int?(duration)

  prompt 'Invalid duration, try again.'
end

## Calculate
# monthly interest rates, loan duration in months, monthly payment
# formula -> m = p * (j / (1 - (1 + j)**(-n)))
prompt "Calculating your loan..."

monthly_interest = apr.to_f / 12.0 / 100
duration_months = duration.to_f * 12
monthly_payment = loan_amount.to_f * (monthly_interest / \
  (1 - (1 + monthly_interest)**(-duration_months)))

prompt "Monthly interest rate: #{(monthly_interest * 100).round(2)} %"
prompt "Loan duration: #{duration_months.to_i} months"
prompt "Monthly payment: $#{monthly_payment.round(2)}"
