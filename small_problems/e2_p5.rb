print "What is your name? "
name = gets.chomp

if name[-1] == '!'
  puts "HELLO #{name.chomp('!').upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end