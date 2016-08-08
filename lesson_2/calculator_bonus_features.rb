def prompt(message)
  Kernel.puts("=> #{message}")
end

def is_int?(num)
  num =~ /^[0-9]+$/ #created a regular expression to make sure num only contains characters 0-9
end

def is_float?(num)
  num.to_f().to_s() == num
end

def operation_to_message(op)
  operation_to_perform = case op
  when '1'
    'Adding'
  when '2'
    "Subtracting"
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end

  return operation_to_perform
end

def number?(num) #see if number is Integer or Float
  is_int?(num) || is_float?(num)
end

prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}")

loop do
  number1 = ''

  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  number2 = ''
  loop do
    prompt("Whats the second number?")
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG
What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             number1.to_f() / number2.to_f()
           end
  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator. Good bye")
