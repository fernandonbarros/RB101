def titleize(sentence)
  capital_words = sentence.split.map {|word| word.capitalize}

  capital_words.join(' ')
end

words = "the flintstones rock"

puts titleize(words)