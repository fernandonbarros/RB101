require 'pry'

DIGITS = ('0'..'9').to_a

# Before looking at solution
def integer_to_string(number)
  highest_order = 1
  until number / highest_order < 10
    highest_order *= 10
  end

  str = ''
  numerator = number
  until highest_order < 1
    digit = numerator / highest_order
    str << DIGITS[digit]
    numerator -= digit * highest_order
    highest_order /= 10
  end
  str
end

# After looking at solution
def integer_to_string(number)
  str = ''
  loop do
    number, remainder = number.divmod(10)
    str << DIGITS[remainder]
    break if number == 0
  end
  str.reverse
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'