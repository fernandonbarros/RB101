puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

area_meters = length * width
puts "The are of the room is #{area_meters} (#{(area_meters * 10.7639).round(2)} square feet)."