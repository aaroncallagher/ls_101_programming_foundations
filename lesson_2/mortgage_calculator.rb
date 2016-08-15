# METHODS

def prompt(message)
  puts("=> #{message}")
end

def apr_estimate(score)
  annual_percentage_rate =
    if score <= 620
      "12.5"
    elsif score <= 660
      "8.5"
    elsif score <= 720
      "4.5"
    else
      "1.9"
    end
  annual_percentage_rate
end

def int?(num)
  num =~ /^[0-9]+$/
end

def float?(num)
  num.to_f().to_s() == num
end

def number?(num)
  int?(num) || float?(num)
end

def monthly_interest_rate(annual_percentage_rate)
  annual_percentage_rate.to_f / 12.0
end

def loan_duration_in_months(years)
  years * 12
end

def monthly_payment_calculator(loan_amount, monthly_interest, loan_length_months)
  loan_amount * ((monthly_interest * 0.01) / (1 - (1 + (monthly_interest * 0.01))**-loan_length_months))
end

prompt("Loan Payment Estimator - See Your Monthly Payments Now!")

prompt("Who do I have the pleasure of speaking with?")

name = ''
loop do
  name = gets().chomp()

  if name.empty?()
    prompt("I like knowing who I am talking to, I am but a lonely robot. Please tell me your name.")
  else
    break
  end
end

prompt("Hi, #{name}. Let's find out exactly how much your monthly payment will be.")
sleep(1)

prompt("First, I'm gonna need to ask you a few questions.")
sleep(1)

prompt("What amount are you attempting to borrow?")

loan_amount = ''
loop do
  loan_amount = gets().chomp().gsub(/\D/, '')
  if number?(loan_amount)
    prompt("Alright, #{name}. I see you are looking to borrow $#{loan_amount} dollars")
    break
  else
    prompt("Hmm... that doesn't look like a valid number")
  end
  sleep(2)
end

loan_amount_for_calc = loan_amount.to_i

prompt("What is your estimated Credit Score? We use this to determine your APR")

credit_score = ''
loop do
  credit_score = gets().chomp().to_i

  if credit_score < 351 || credit_score > 800
    prompt("Your credit score ranges from 350 - 800. Please enter a valid number")
  else
    break
  end
end

annual_percentage_rate = apr_estimate(credit_score)

prompt("Based on your Credit Score, your estimated APR is #{annual_percentage_rate}%")

monthly_interest = monthly_interest_rate(annual_percentage_rate)

prompt("How long would you like the loan to last (in years)?")

loan_duration = ''
loop do
  loan_duration = gets().chomp().to_i

  if loan_duration < 3 || loan_duration > 6
    prompt("Loan duration must be between 3 and 6 years")
  else
    break
  end
end

loan_length_months = loan_duration_in_months(loan_duration)

prompt("Ok #{name}, I see you want the loan to last #{loan_duration} years")
sleep(1)

prompt("Now we have everything we need to calculate your monthly payment...")
sleep(1)

monthly_payment = monthly_payment_calculator(loan_amount_for_calc, monthly_interest, loan_length_months)
monthly_payment = monthly_payment.round(2)

prompt("Borrowing $#{loan_amount} dollars, at #{annual_percentage_rate}% APR over #{loan_duration} years will cost you $#{monthly_payment} monthly")
