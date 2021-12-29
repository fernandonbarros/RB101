puts "What is the name?"
name = gets.chomp

if name.empty?
  puts "Teddy is #{rand(20..200)} years old!"
else
  puts "#{name} is #{rand(20..200)} years old!"
end