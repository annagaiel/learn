loan_amount = ''
interest_rate = ''
loan_duration = ''
tot_monthly_pay = ''

def prompt(msg)
  Kernel.puts("=> #{msg}")
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

# P = L[c(1 + c)n]/[(1 + c)n - 1]
# http://www.mtgprofessor.com/formulas.htm
def calculate_monthly_pay(loan_amount, interest_rate, loan_duration)
  loan_amount * (interest_rate * ( 1 + interest_rate) * loan_duration) /
  (interest_rate * ( 1 + interest_rate) * (loan_duration - 1))
end

loop do
  prompt('Welcome to Mortgage Calculator')

  loop do
    prompt('Enter the Mortgage amount ($):')
    loan_amount = Kernel.gets.chomp
    if valid_number?(loan_amount)
      loan_amount = loan_amount.to_f
      break
    else
      prompt('Hmm... invalid input')
    end
  end

  loop do
    prompt('Enter the Interest rate (%):')
    interest_rate = Kernel.gets.chomp
    if valid_number?(interest_rate)
      interest_rate = (interest_rate.to_f() / 100) / 12
      break
    else
      prompt('Hmm... invalid input')
    end
  end

  loop do
    prompt('What is the loan duration in years?')
    loan_duration = Kernel.gets.chomp
    if loan_duration.to_i > 0
      loan_duration = loan_duration.to_i() * 12
      break
    else
      prompt('Hmm... invalid input')
    end
  end

  tot_monthly_pay = calculate_monthly_pay(loan_amount, interest_rate, loan_duration)

  prompt("Monthly payment duration:\n #{loan_duration} months")
  prompt("Interest rate:\n#{interest_rate}% months")
  prompt("Loan amount:\n$#{loan_amount.round(2)}")
  prompt("Total monthly payment:\n$#{tot_monthly_pay.round(2)}")

  prompt("Another calculation?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator, good bye!")
