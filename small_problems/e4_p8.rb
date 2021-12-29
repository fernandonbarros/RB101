DIGITS = ('0'..'9').to_a.zip(0..9).to_h

def string_to_integer(str)
  total = 0
  str.chars.each { |chr| total = total * 10 + DIGITS[chr]}
  total
end

def string_to_signed_integer(str)
  if str[0] == '-'
    - string_to_integer(str[1..])
  elsif str[0] == '+'
    string_to_integer(str[1..])
  else
    string_to_integer(str)
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100