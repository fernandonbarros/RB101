print 'What is the bill? '
bill = gets.chomp.to_f
print 'What is the tip percentage? '
tip_percentage = gets.chomp.to_f
tip = bill * tip_percentage / 100

puts "The tip is $%0.2f" % [tip]
puts "The total is $%0.2f" % [tip + bill]