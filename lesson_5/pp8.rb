hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
VOWELS = 'aeiou'

hsh.each_value do |arr|
  arr.each do |string|
    vowels = string.chars.each {|char| puts char if VOWELS.include?(char)}
  end
end
