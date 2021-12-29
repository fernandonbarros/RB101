DIGITS = ('0'..'9').to_a

def integer_to_string(number)
  str = ''
  loop do
    number, remainder = number.divmod(10)
    str << DIGITS[remainder]
    break if number == 0
  end
  str.reverse
end

def signed_integer_to_string(number)
  if number > 0
    '+' + integer_to_string(number)
  elsif number < 0
    '-' + integer_to_string(-number)
  else
    integer_to_string(number)
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'