statement = "The Flintstones Rock"

letters = ('a'..'z').to_a

frequencies = letters.each_with_object({}) do |letter, hash|
  frequency = statement.downcase.count(letter)
  hash[letter] = frequency if frequency > 0 
end

puts frequencies