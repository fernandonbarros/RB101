def crunch(words)
  previous_chr = nil
  chars = words.chars.map do |chr|
    if chr == previous_chr || previous_chr == ''
      chr = '' 
    else
      previous_chr = chr
    end
    chr
  end
  chars.join
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''