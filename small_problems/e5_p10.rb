def print_in_box(sentence)
  length = sentence.length
  to_print = ["+#{'-'*(length+2)}+"]
  to_print << ["|#{' '*(length+2)}|"]
  to_print << ["| #{sentence} |"]
  to_print << ["|#{' '*(length+2)}|"]
  to_print << ["+#{'-'*(length+2)}+"]
  puts to_print
end

print_in_box('To boldly go where no one has gone before.')

puts '----------'

print_in_box('')