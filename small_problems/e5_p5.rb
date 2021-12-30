ALPHANUMERIC = ('a'..'z').to_a + ('0'..'9').to_a

def cleanup(sentence)
  previous_chr = nil
  chars = sentence.chars.map do |chr|
    if ALPHANUMERIC.include?(chr)
      chr
    elsif previous_chr == ' ' || previous_chr == ''
      chr = ''
    else
      chr = ' '
    end
    previous_chr = chr
  end
  chars.join
end

# Suggested solution
def cleanup(sentence)
  sentence.gsub(/[^a-z]/, ' ').squeeze(' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '