# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def int?(n)
  n.to_i.to_s == n
end

def float?(n)
  n.to_f.to_s == n
end

def valid_number?(n)
  int?(n) || float?(n)
end

def operation_to_message(op)
  op_string = case op
                when '1'
                  messages('op1', lang=LANGUAGE)
                when '2'
                  messages('op2', lang=LANGUAGE)
                when '3'
                  messages('op3', lang=LANGUAGE)
                when '4'
                  messages('op4', lang=LANGUAGE)
              end
  return op_string
end

#prompt 'Welcome to the Ruby calculator! Enter your name:'
prompt messages('welcome', lang=LANGUAGE)

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt messages('invalid_name', lang=LANGUAGE)
  else
    break
  end
end

prompt "#{messages('greeting', lang=LANGUAGE)} #{name}"

loop do
  n1 = nil
  loop do
    prompt messages('first_number', lang=LANGUAGE)
    n1 = gets.chomp
    if valid_number?(n1)
      break
    else
      prompt messages('invalid_number', lang=LANGUAGE)
    end
  end

  n2 = nil
  loop do
    prompt messages('second_number', lang=LANGUAGE)
    n2 = gets.chomp

    if valid_number?(n1)
      break
    else
      prompt messages('invalid_number', lang=LANGUAGE)
    end
  end

    operator_prompt = messages('operator_prompt', lang=LANGUAGE)

  prompt operator_prompt

  op = ''
  loop do
    op = gets.chomp

    if %w(1 2 3 4).include?(op)
      break
    else
      prompt messages('invalid_operators', lang=LANGUAGE)
    end
  end

  prompt operation_to_message(op)

  result = case op.to_i
           when 1
             n1.to_f + n2.to_f
           when 2
             n1.to_f - n2.to_f
           when 3
             n1.to_f * n2.to_f
           when 4
             n1.to_f / n2.to_f
           end
  prompt "#{messages('result_is', lang=LANGUAGE)} #{result}"

  prompt messages('another_calculation', lang=LANGUAGE)
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt messages('goodbye', lang=LANGUAGE)
