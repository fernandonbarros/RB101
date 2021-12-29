ALPHANUMERICS = ('a'..'z').to_a + (0..9).to_a

def palindrome?(str)
  str == str.reverse
end

def real_palindrome?(str)
  chars =str.downcase.chars.select { |chr| ALPHANUMERICS.include?(chr) }
  palindrome?(chars.join)
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false