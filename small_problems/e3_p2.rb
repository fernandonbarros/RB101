def prompt(msg)
  puts "==> #{msg}"
end

def result_message(n1, n2, operator)
  result = case operator
  when '+'
    n1 + n2
  when '-'
    n1 - n2
  when '*'
    n1 * n2
  when '/'
    n1 / n2
  when '%'
    n1 % n2
  when '**'
    n1 ** n2
  end

  prompt "#{n1} #{operator} #{n2} = #{result}"
end


prompt "Enter the first number:"
first = gets.chomp.to_i
prompt "Enter the second number:"
second = gets.chomp.to_i

operators = ['+', '-', '*', '/', '%', '**']
operators.each {|op| result_message(first, second, op)}