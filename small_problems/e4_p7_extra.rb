HEX_DIGITS = (('0'..'9').to_a + ('a'..'f').to_a).zip((0..15).to_a).to_h

def hexadecimal_to_integer(hex)
  total = 0
  hex.downcase.chars.each { |chr| total = total * 16 + HEX_DIGITS[chr]}
  total
end

puts hexadecimal_to_integer('4D9f') == 19871