numbers = []

ordinals = {
  1 => 'st',
  2 => 'nd',
  3 => 'rd',
  4 => 'th',
  5 => 'th'
}

5.times do |n|
  puts "==> Enter the #{n+1}#{ordinals[n+1]} number:"
  numbers << gets.chomp.to_i
end

puts "==> Enter the last number:"
last_number = gets.chomp.to_i

if numbers.include?(last_number)
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}"
end
