require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'es'

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

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
          messages('adding', LANGUAGE)
         when '2'
          messages('subtracting', LANGUAGE)
         when '3'
          messages('multiplying', LANGUAGE)
         when '4'
          messages('dividing', LANGUAGE)
         end
  x = "..."
  word += x
end

loop do # main loop
  prompt(messages('welcome', LANGUAGE))
  name =  ''

  loop do
    name = Kernel.gets.chomp
    if name.empty?
      prompt(messages('valid_name', LANGUAGE))
    else
      break
    end
  end

  prompt("#{messages('greeting', LANGUAGE)} #{name}!")

  number_1 = ''
  loop do
    prompt(messages('enter_num1', LANGUAGE))
    number_1 = Kernel.gets.chomp

    if valid_number?(number_1)
      break
    else
      prompt(messages('invalid_num', LANGUAGE))
    end
  end

  number_2 = ''
  loop do
    prompt(messages('enter_num2', LANGUAGE))
    number_2 = Kernel.gets.chomp

    if valid_number?(number_2)
      break
    else
      prompt(messages('invalid_num', LANGUAGE))
    end
  end

  prompt(messages('operation_question', LANGUAGE))

  operator = ''

  loop do
    operator = Kernel.gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('choose_operation', LANGUAGE))
    end
  end

  prompt("#{operation_to_message(operator)} #{messages('loading_operation', LANGUAGE)}")

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

  prompt("#{messages('operation_result', LANGUAGE)} #{result}.")

  prompt(messages('another_calculation', LANGUAGE))
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages('goodbye', LANGUAGE))
