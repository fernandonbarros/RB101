def word_sizes(words)
  letter_counts = {}
  words.split.each do |word|
    word_length = word.length
    letter_counts[word_length] = 0 unless letter_counts.include?(word_length)
    letter_counts[word_length] += 1
  end
  letter_counts
end

# After reading solution

def word_sizes(words)
  counts = Hash.new(0)
  words.split.each { |word| counts[word.length] += 1}
  counts
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}