current_year = Time.now.year

print "What is your age? "
age = gets.chomp.to_i

print "At what age would you like to retire? "
retirement_age = gets.chomp.to_i

retirement_year = current_year + retirement_age - age
puts "It's #{current_year}. You will retire in #{retirement_year}"
puts "You only have #{retirement_age - age} of work to go!"