def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.length == 4

  dot_separated_words.each do |word|
    return false unless is_an_ip_number?(word)
  end
  
  return true
end