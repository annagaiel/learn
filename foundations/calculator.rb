
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(input)
  input.to_f.to_s == input
end

def operation_to_message(op)
  word = case op
         when '1'
          'Adding'
         when '2'
          'Subtracting'
         when '3'
          'Multiplying'
         when '4'
          'Dividing'
         end
  x = "..."
  word += x
end

loop do # main loop
  prompt('Welcome to Calculator! Enter your name:')
  name =  ''

  loop do
    name = Kernel.gets.chomp
    if name.empty?
      prompt('Make sure to enter valid name.')
    else
      break
    end
  end

  prompt("Hi #{name}!")

  number_1 = ''
  loop do
    prompt('Enter your first number')
    number_1 = Kernel.gets.chomp

    if valid_number?(number_1)
      break
    else
      prompt("Hmm... That doesn't look right")
    end
  end

  number_2 = ''
  loop do
    prompt('Enter your second number')
    number_2 = Kernel.gets.chomp

    if valid_number?(number_2)
      break
    else
      prompt("Hmm... That doesn't look right")
    end
  end

  operator_prompt = <<-MSG
  What operation do you want to perform:
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''

  loop do
    operator = Kernel.gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('Must choose from 1, 2, 3, 4')
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number_1.to_i + number_2.to_i
           when '2'
             number_1.to_i - number_2.to_i
           when '3'
             number_1.to_i * number_2.to_i
           when '4'
             number_1.to_f / number_2.to_f
           end

  prompt("The result is #{result}.")

  prompt('Do you want to perform another calculation? (Y to calculate again)')
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thanks for using the calculator, bye!')
