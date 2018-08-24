def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  /(^[0-9]+\.[0-9]+$|^[0-9]+$)/.match(num)
end

prompt("Welcome to the Mortgage Calculator!")

loop do
  loan_amount = nil
  loop do
    prompt("What is the loan amount?")
    loan_amount = gets.chomp

    if valid_number?(loan_amount)
      loan_amount = loan_amount.to_i
      break
    end

    prompt("Hmm... That doesn't look like a valid number.")
  end

  apr = nil
  loop do
    prompt("What is the APR? (ex: 7.5 for 7.5%)")
    apr = gets.chomp

    if valid_number?(apr)
      apr = apr.to_f * 0.01
      break
    end

    prompt("Hmm... That doesn't look like a valid APR.")
  end

  loan_duration_years = nil
  loop do
    prompt("What is the loan duration in years?")
    loan_duration_years = gets.chomp

    if valid_number?(loan_duration_years) && loan_duration_years.to_i >= 1
      loan_duration_years = loan_duration_years.to_i
      break
    end

    prompt("Hmm... That doesn't look like a valid number.")
  end

  monthly_interest_rate = apr / 12
  loan_duration_months = loan_duration_years * 12

  if monthly_interest_rate == 0
    monthly_payment = loan_amount.to_f / loan_duration_months
  else
    monthly_payment = loan_amount * (monthly_interest_rate /
                      (1 - (1 + monthly_interest_rate)**-loan_duration_months))
  end

  prompt("Your monthly payment will be $#{format('%02.2f', monthly_payment)}.")

  answer = nil
  loop do
    prompt("Do you need to calculate another monthly payment? (Y or N)")
    answer = gets.chomp.downcase
    break if %w(y n yes no).include?(answer)
    prompt("Please answer with Y or N")
  end
  break unless %w(y yes).include?(answer)
end

prompt("Thank you for using the Mortgage Calculator. Goodbye!")
